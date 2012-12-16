# encoding: utf-8
require 'spec_helper'
require 'marhan_cli/apps/virtual_box'
require 'marhan_cli/config'

describe "VirtualBoxApp" do

  let(:config_param) { MarhanCli::Config.init(
      File.join("spec", "unit", "fixtures", "config.yml")).vbox.guests }

  let(:subject) { MarhanCli::VirtualBox.new(config_param) }

  context ".new" do
    describe "with empty hash as argument" do
      it "creates a new objects" do
        subject.should be_a(MarhanCli::VirtualBox)
      end
    end

    describe "with config hash as argument" do
      it "has set config hash" do
        subject.guests.should eq(config_param)
      end
    end
  end

  context ".start_guest" do
    describe "with configured guest as argument" do
      it "returns correct command" do
        subject.start_guest('linux').should eq("VBoxManage startvm 'Ubuntu Linux'")
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

  context ".stop_guest" do
    describe "with configured guest as argument" do
      it "returns correct command" do
        subject.stop_guest('linux').should eq("VBoxManage controlvm 'Ubuntu Linux' acpipowerbutton")
      end
    end
  end
end