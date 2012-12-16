# encoding: utf-8
require 'net/ssh'
require 'marhan_cli/helper/constraint'
require 'marhan_cli/network/remote_machine'

module MarhanCli
  class VirtualBox

    attr_reader :guests

    def initialize(guests)
      @guests = guests
    end

    def start_guest(guest_config_name)
      "VBoxManage startvm '#{vbox_name(guest_config_name)}'"
    end

    def stop_guest(guest_config_name)
      "VBoxManage controlvm '#{vbox_name(guest_config_name)}' acpipowerbutton"
    end

    def guest_ssh_server_up?(guest_config_name)
      remote_machine = RemoteMachine.new(@guests[guest_config_name].ssh.host, @guests[guest_config_name].ssh.port)
      remote_machine.ssh_server_running?(@guests[guest_config_name].ssh.user)
    end

    def vbox_name(guest_config_name)
      Constraint.not_nil_or_empty! guest_config_name, "Guest config name have to be set!"
      Constraint.not_nil_or_empty! @guests[guest_config_name], "No guest with key '#{guest_config_name}' found in configuration!"
      Constraint.not_nil_or_empty! @guests[guest_config_name].name, "Guest name is not configured!"
      @guests[guest_config_name].name
    end
  end
end