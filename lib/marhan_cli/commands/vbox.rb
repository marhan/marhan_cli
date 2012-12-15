# encoding: utf-8
require 'marhan_cli/command'
require 'marhan_cli/app/virtual_box_app'

module MarhanCli
  class VBox < MarhanCli::Command

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

    def start_guest
      Proc.new do
        config = load_vbox_config
        virtual_box = VirtualBoxApp.new(config.guests)
        guest_to_start = get_or_ask(:guest)
        run virtual_box.start_guest(guest_to_start)
      end
    end

    def stop_guest
      Proc.new do
        config = load_vbox_config
        virtual_box = VirtualBoxApp.new(config.guests)
        guest_to_start = get_or_ask(:guest)
        run virtual_box.stop_guest(guest_to_start)
      end
    end

    def load_vbox_config
      load_config.vbox
    end

  end
end