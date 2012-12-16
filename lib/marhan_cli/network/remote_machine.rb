require 'net/ssh'
require 'marhan_cli/helper/constraint'

module MarhanCli
  class RemoteMachine

    def initialize(host, port)
      Constraint.not_nil!(host, "host")
      Constraint.not_nil!(port, "port")
      @host = host
      @port = port
    end

    def add_id_to_authorized_keys(user, password, id_file)
      Constraint.not_nil!(user, "user")
      Constraint.not_nil!(password, "password")
      Constraint.not_nil!(id_file, "id_file")

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

    def wait_for_ssh_server_status(user)
      Net::SSH.start(@home, user, :port => @port) do |ssh|
        status = "";
        channel = ssh.open_channel do |ch|
          ch.exec "status ssh" do |ch, success|
            raise "could not execute command" unless success
            ch.on_data do |c, data|
              status << data
            end
            ch.on_extended_data do |c, type, data|
              $STDERR.print data
            end
          end
        end
        channel.wait
        return status
      end
    end

    def ssh_server_running?(user)
      status = wait_for_ssh_server_status(user)
      status.match(%r{ssh start/running.+})
    end

    def exec_remote_command(user, remote_command)
      Net::SSH.start(@host, user, :port => @port) do |ssh|
        stderr = ""
        ssh.exec!(remote_command) do |channel, stream, data|
          stderr << data if stream == :stderr
        end
        raise RemoteMachineError, "#{stderr}" unless stderr.empty?
      end
    end
  end
end