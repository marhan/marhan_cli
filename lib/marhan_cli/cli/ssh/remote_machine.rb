require 'net/ssh'
require 'marhan_cli/cli/helper/constraint'

module MarhanCli
  class RemoteMachine

    def initialize(user, host, port = 22)
      Constraint.notNil!(user)
      Constraint.notNil!(host)
      Constraint.notNil!(port)

      @user = user
      @host = host
      @port = port
    end
  end

  def add_id_to_authorized_keys(password, id_file)
    Constraint.notNil!(password)
    Constraint.notNil!(idFile)

    id_pub_content = File.read File.expand_path(id_file)
    puts "copying content of #{id_file} to remote host"

    begin
      Net::SSH.start(@host, @user, {:port => @port, :password => password}) do |ssh|
        remote_host_name = ssh.exec!("hostname")
        puts "Connected to #{remote_host_name}"
        insert_into_authorized_keys(id_pub_content, ssh)
      end
    rescue Errno::ECONNREFUSED => error
      puts "Could not copy #{id_file}: #{error}"
    end
  end

  def insert_into_authorized_keys(id_pub_content, ssh)
    stdout = ""
    stderr = ""
    ssh.exec!("echo '#{id_pub_content}' >> ~/.ssh/authorized_keys") do |channel, stream, data|
      stdout << data if stream == :stdout
      stderr << data if stream == :stderr
    end
    puts "Remote Machine stdout: #{stdout}" unless stdout.empty?
    puts "Remote Machine stderr: #{stderr}" unless stderr.empty?
  end

end