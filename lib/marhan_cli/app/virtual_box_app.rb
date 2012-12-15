# encoding: utf-8
require 'marhan_cli/helper/constraint'

module MarhanCli
  class VirtualBoxApp

    attr_reader :guests

    def initialize(guests)
      @guests = guests
    end

    def start_guest(guest_config_name)
      "VBoxManage startvm '#{vbox_name(guest_config_name)}'"
    end

    def stop_guest(guest_config_name)
      "VBoxManage controlvm '#{vbox_name(guest_config_name)}' poweroff"
    end

    def vbox_name(guest_config_name)
      Constraint.not_nil_or_empty! guest_config_name, "Guest config name have to be set!"
      vbox_name = @guests[guest_config_name]
      Constraint.not_nil_or_empty! vbox_name, "No guest with key '#{guest_config_name}' found in configuration"
      vbox_name
    end
  end
end