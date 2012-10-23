require 'net/ssh'

module MarhanCli
  class Cli
    include Thor::Actions

    desc "add_ssh_key", "Copies public ssh key into authorized_keys"

    def add_ssh_key(user, password, host)
      #https://gist.github.com/1639381
      puts "Connecting to #{host}..."

      id_pub_content = File.read File.expand_path("~/.ssh/id_rsa.pub")

      puts "copying id to remote host #{id_pub_content}"

      Net::SSH.start(host, user, {:password => password, :port => 2222}) do |ssh|
        # capture all stderr and stdout output from a remote process
        remote_host_name = ssh.exec!("hostname")

        puts "Connected to #{remote_host_name}"

        # capture only stdout matching a particular pattern
        stdout = ""
        stderr = ""
        ssh.exec!("echo '#{id_pub_content}' >> ~/.ssh/authorized_keys") do |channel, stream, data|
          stdout << data if stream == :stdout
          stderr << data if stream == :stderr
        end
        puts stdout
        puts stderr

      end

    end
  end
end