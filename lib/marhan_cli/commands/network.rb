# encoding: utf-8
require 'marhan_cli/network/remote_machine'
require 'marhan_cli/command'

module MarhanCli
  class Network < MarhanCli::Command

    namespace :net

    desc "net:add-ssh-key", "Copies public ssh id into authorized_keys"

    method_option :user,
                  :type => :string,
                  :aliases => "-u",
                  :desc => "Name of user on remote machine"

    method_option :host,
                  :type => :string,
                  :aliases => "-h",
                  :desc => "Name of remote machine"

    method_option :port,
                  :type => :numeric,
                  :aliases => "-p",
                  :default => 22,
                  :desc => "Port of remote machine"

    method_option :file,
                  :type => :string,
                  :aliases => "-f",
                  :default => "~/.ssh/id_rsa.pub",
                  :desc => "Path of id file"

    def add_ssh_key
      host = get_or_ask(:host)
      user = get_or_ask(:user)
      password = get_or_ask(:password)
      id_file = get(:file)
      port = get(:port)

      remote_machine = RemoteMachine.new(host, port)
      remote_machine.add_id_to_authorized_keys(user, password, id_file)
      say "successfully copied #{id_file} to #{host}", :green
    rescue Exception => e
      exit_with_error("copying of id file to remote machine failed: #{e}")
    end

    protected

    def get(option_name)
      options[option_name]
    end

    def get_or_ask(option_name)
      options[option_name] || ask_for_option(:host)
    end

    def ask_for_option(option)
      value = ask("Please enter #{option}:")
      raise Thor::Error, "You must enter a value for that field." if value.empty?
      value
    end
  end
end
