# encoding: utf-8

module MarhanCli
  class Jenkins

    def initialize
      @config_file = "/Library/LaunchDaemons/org.jenkins-ci.plist"
    end

    def start_command
      "sudo launchctl load #@config_file"
    end

    def stop_command
      "sudo launchctl unload #@config_file"
    end

  end
end