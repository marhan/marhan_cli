# encoding: utf-8
require 'spec_helper'
require 'marhan_cli/apps/bash'

describe "bash" do

  context ".new" do
    it "creates new instance" do
      MarhanCli::Bash.new.should be_a(MarhanCli::Bash)
    end
  end

  context ".ssh_command" do

    let(:subject) { MarhanCli::Bash.new }
    let(:params) { {:user => "any_user", :password => "any_password", :host => "any_host"} }

    describe "with valid params" do

      it "returns ssh command string for user, password and host" do
        subject.ssh_command(params).should eq("ssh any_host -l any_user -p 22")
      end

      it "returns ssh command string for user, password, host and port" do
        subject.ssh_command(params.merge({:port => "2222"})).should eq("ssh any_host -l any_user -p 2222")
      end

    end

    describe "raises error" do

      it "if user not set" do
        expect {
          subject.ssh_command(params.merge({:user => nil}))
        }.to raise_error(error=ArgumentError, message="user has to be set")
      end

      it "if host not set" do
        expect {
          subject.ssh_command(params.merge({:host => nil}))
        }.to raise_error(error=ArgumentError, message="host has to be set")
      end
    end

  end

end