# encoding: utf-8
require 'spec_helper'
require 'marhan_cli/apps/virtual_box'
require 'marhan_cli/config'

describe MarhanCli::VirtualBox do

  let(:config_param) { MarhanCli::Config.init.vbox }

  let(:subject) { MarhanCli::VirtualBox.new(config_param) }

  context ".new" do
    describe "with empty hash as argument" do
      it "creates a new objects" do
        subject.should be_a(MarhanCli::VirtualBox)
      end
    end

    describe "with config hash as argument" do
      it "has set config hash" do
        subject.guests.should eq(config_param.guests)
      end
    end
  end

  context ".guest_start_command" do
    describe "with configured guest as argument" do
      it "returns correct command" do
        subject.guest_start_command('linux').should eq("VBoxManage startvm 'Ubuntu Linux'")
      end
    end

  end

  context ".vbox_name" do
    describe "with configured guest as argument" do
      it "returns correct command" do
        subject.vbox_name('linux').should eq('Ubuntu Linux')
      end
    end

    describe "with not configured guest as argument" do
      it "raise error" do
        expect {
          subject.vbox_name('minix')
        }.to raise_error(
                 error=ArgumentError,
                 message="No guest with key 'minix' found in configuration!")
      end
    end

    describe "with empty guest as argument" do
      it "raise error" do
        expect {
          subject.vbox_name('')
        }.to raise_error(
                 error=ArgumentError,
                 message="Guest config name have to be set!")
      end
    end
  end

  context ".guest_stop_command" do
    describe "with configured guest as argument" do
      it "returns correct command" do
        subject.guest_stop_command('linux').should eq("VBoxManage controlvm 'Ubuntu Linux' acpipowerbutton")
      end
    end
  end

  context ".ssh_connection_configured?" do
    describe "if ssh connection is configured" do
      it "returns 'true'" do
        subject.ssh_connection_configured?('linux').should be(true)
      end
    end

    describe "if ssh connection is not configured" do
      it "returns 'false'" do
        subject.ssh_connection_configured?('windows').should be(false)
      end
    end

  end

  context ".guest_ssh_command" do

    describe "with existing ssh configuration" do
      it "returns ssh connection command" do
        subject.guest_ssh_command('linux').should eq("ssh localhost -l nameofuser -p 2222")
      end
    end

    describe "without any ssh configuration " do
      it "raise error" do
        expect {
          subject.guest_ssh_command('windows')
        }.to raise_error(error=ArgumentError, message="No ssh configuration found for windows")
      end
    end

  end

end