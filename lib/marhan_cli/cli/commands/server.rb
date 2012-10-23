require 'marhan_cli/cli/ssh/remote_machine'

module MarhanCli
  class Cli
    include Thor::Actions

    desc "add_ssh_key USER PASSWORD HOST [--port PORT]", "Copies public ssh id into authorized_keys"
    method_options :port => :Fixnum
    def add_ssh_key(user, password, host)

      puts "Connecting to #{host}..."

      id_file = "~/.ssh/id_rsa.pub"


      remote_machine = RemoteMachine.new(user, host, options[:port])
      remote_machine.add_id_to_authorized_keys(password, id_file)

    end

  end
end