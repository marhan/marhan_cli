# encoding: utf-8
require 'spec_helper'
require 'marhan_cli/app/virtual_box_app'

describe "VirtualBoxApp" do

  let(:config_param) { Hashie::Mash.new(:linux => 'Ubuntu Linux') }

  context ".new" do
    describe "with empty hash as argument" do
      let(:subject) { MarhanCli::VirtualBoxApp.new({}) }
      it "creates a new objects" do
        subject.should be_a(MarhanCli::VirtualBoxApp)
      end
    end

    describe "with config hash as argument" do
      let(:subject) { MarhanCli::VirtualBoxApp.new(config_param) }

      it "has set config hash" do
        subject.guests.should eq(config_param)
      end
    end
  end

  context ".start_guest" do
    let(:subject) { MarhanCli::VirtualBoxApp.new(config_param) }

    describe "with configured guest as argument" do
      it "returns correct command" do
        subject.start_guest('linux').should eq("VBoxManage startvm 'Ubuntu Linux'")
      end
    end

  end

  context ".vbox_name" do
    let(:subject) { MarhanCli::VirtualBoxApp.new(config_param) }

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
                 message="No guest with key 'minix' found in configuration")
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

    let(:subject) { MarhanCli::VirtualBoxApp.new(config_param) }

    describe "with configured guest as argument" do
      it "returns correct command" do
        subject.stop_guest('linux').should eq("VBoxManage controlvm 'Ubuntu Linux' poweroff")
      end
    end
  end

end