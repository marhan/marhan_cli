# encoding: utf-8
require 'spec_helper'
require 'marhan_cli/config'

describe "Config" do

  context "self.init" do
    let(:subject) { MarhanCli::Config.init() }

    describe "returns config" do
      it "as Hashie::Mash" do
        subject.should be_a(Hashie::Mash)
      end
    end

    describe "returns TrueCrypt config" do

      let(:crypt) { subject.crypt }

      it "with with mount_folder" do
        crypt.mount_folder.should eq("/Volumes")
      end

      it "with with encrypted_devices" do
        crypt.encrypted_devices.hdd.should eq("/dev/rdisk2s2")
      end
    end

    describe "returns VirtualBox config" do
      let(:vbox) { subject.vbox }
      it "with 'Ubuntu' for guests.linux.name" do
        vbox.guests.linux.name.should eq("Ubuntu Linux")
      end

      it "with 'Ubuntu' for guests['linux'].name" do
        vbox.guests['linux'].name.should eq("Ubuntu Linux")
      end

      it "with 'localhost' for guests.linux.ssh.host" do
        vbox.guests.linux.ssh.host.should eq("localhost")
      end

      it "with 'nameofuser' for guests.linux.ssh.user" do
        vbox.guests.linux.ssh.user.should eq("nameofuser")
      end

      it "with 'nil' for guests.windows.ssh" do
        vbox.guests.windows.key?(:ssh).should be_false
      end

    end

  end
end