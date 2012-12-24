# encoding: utf-8
require 'spec_helper'
require 'marhan_cli/apps/jenkins'

describe "Jenkins" do

  let(:subject) { MarhanCli::Jenkins.new }

  context ".new" do
    it "creates a new instance of Jenkins" do
      subject.should be_a(MarhanCli::Jenkins)
    end
  end

  context ".start_command" do

    it "returns command string" do
      subject.start_command.should eq("sudo launchctl load /Library/LaunchDaemons/org.jenkins-ci.plist")
    end
  end

  context ".stop_command" do

    it "returns command string" do
      subject.stop_command.should eq("sudo launchctl unload /Library/LaunchDaemons/org.jenkins-ci.plist")
    end

  end

end