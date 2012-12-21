# encoding: utf-8
require 'marhan_cli/command'
require 'marhan_cli/apps/virtual_box'
require 'marhan_cli/apps/bash'

module MarhanCli
  class VBoxCommand < MarhanCli::Command

    namespace :vbox

    desc "vbox:start", "Starts VirtualBox guest system"

    method_option :guest,
                  :type => :string,
                  :aliases => "-g",
                  :desc => "Name of the guest system in configuration file."

    def start
      execute start_guest
    end

    desc "vbox:stop", "Stops VirtualBox guest system"

    method_option :guest,
                  :type => :string,
                  :aliases => "-g",
                  :desc => "Name of the guest system in configuration file."

    def stop
      execute stop_guest
    end

    private

    def start_ssh_client

    end

    def start_guest
      Proc.new do
        vbox_config = load_vbox_config
        virtual_box = VirtualBox.new(vbox_config.guests)
        guest_to_start = get_or_ask(:guest)
        run virtual_box.start_guest(guest_to_start)

        if vbox_config.guests[guest_to_start].key?(:ssh)
          say ""
          say "Waiting for response from SSH server...", :green
          if virtual_box.guest_ssh_server_up?(guest_to_start)
            say "SSH server is up. Trying to connect...", :green
            say ""
            # set user by configuration

            bash = MarhanCli::Bash.new
            ssh_config = vbox_config.guests[guest_to_start].ssh
            run bash.ssh_command(ssh_config)
          end
        end
      end
    end

    def stop_guest
      Proc.new do
        config = load_vbox_config
        guest_name = get_or_ask(:guest)
        virtual_box = VirtualBox.new(config.guests)
        run virtual_box.stop_guest(guest_name)
      end
    end

    def load_vbox_config
      load_config.vbox
    end

  end
end