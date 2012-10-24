require 'net/ssh'
require 'marhan_cli/cli/helper/constraint'

module MarhanCli
  class RemoteMachine

    def initialize(host, port)
      Constraint.notNil!(host, "host")
      Constraint.notNil!(port, "port")
      @host = host
      @port = port
    end

    def add_id_to_authorized_keys(user, password, id_file)
      Constraint.notNil!(user, "user")
      Constraint.notNil!(password, "password")
      Constraint.notNil!(id_file, "id_file")

      id_pub_content = File.read File.expand_path(id_file)
      id_pub_content = id_pub_content.chomp

      Net::SSH.start(@host, user, {:port => @port, :password => password}) do |ssh|
        stderr = ""
        ssh.exec!("echo '#{id_pub_content}' >> ~/.ssh/authorized_keys") do |channel, stream, data|
          stderr << data if stream == :stderr
        end

        raise RemoteMachineError, "#{stderr}" unless stderr.empty?

      end
    end
  end
end