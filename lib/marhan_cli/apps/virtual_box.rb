# encoding: utf-8
require 'net/ssh'
require 'marhan_cli/helper/constraint'
require 'marhan_cli/network/remote_machine'

module MarhanCli
  class VirtualBox

    attr_reader :guests

    def initialize(config)
      @guests = config.guests
    end

    def guest_start_command(guest_name)
      "VBoxManage startvm '#{vbox_name(guest_name)}'"
    end

    def guest_stop_command(guest_name)
      "VBoxManage controlvm '#{vbox_name(guest_name)}' acpipowerbutton"
    end

    def guest_ssh_server_up?(guest_name)
      remote_machine = RemoteMachine.new(@guests[guest_name].ssh.host, @guests[guest_name].ssh.port)
      remote_machine.ssh_server_running?(@guests[guest_name].ssh.user)
    end

    def ssh_connection_configured?(guest_name)
      @guests[guest_name].key?(:ssh)
    end

    def guest_ssh_command(guest_name)
      bash = MarhanCli::Bash.new
      raise ArgumentError, "No ssh configuration found for #{guest_name}" unless guests[guest_name].ssh?
      bash.ssh_command(guests[guest_name].ssh)
    end

    def vbox_name(guest_name)
      Constraint.not_nil_or_empty! guest_name, "Guest config name have to be set!"
      Constraint.not_nil_or_empty! @guests[guest_name], "No guest with key '#{guest_name}' found in configuration!"
      Constraint.not_nil_or_empty! @guests[guest_name].name, "Guest name is not configured!"
      @guests[guest_name].name
    end
  end
end