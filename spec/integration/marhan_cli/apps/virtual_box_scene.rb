# encoding: utf-8
require 'spec_helper'
require 'marhan_cli/apps/virtual_box'

describe "VirtualBoxApp" do

  let(:config_param) { Hashie::Mash.new(:linux => 'Ubuntu Linux') }
  let(:subject) { MarhanCli::VirtualBox.new(config_param) }

  context ".guest_ssh_server_up?" do
    describe "when system is running" do
      it "returns true" do
        subject.guest_ssh_server_up?("linux").should be_true
      end
    end
  end

  context ".shutdown_guest_system" do
    describe "when system is running" do
      it "system shutdown" do
        subject.shutdown_guest_system("linux").should be_true
      end
    end
  end
end