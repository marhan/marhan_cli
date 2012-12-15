# encoding: utf-8
require 'spec_helper'
require 'marhan_cli/config'

describe "Config" do

  context "self.init" do
    let(:subject) { MarhanCli::Config.init(File.join("spec", "fixtures", "config.yml")) }

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

      it "with with guests.windows" do
        vbox.guests.windows.should eq("Windows XP")
      end

    end

  end
end