# encoding: utf-8

module MarhanCli
  class Bash

    def ssh_command(param)
      raise ArgumentError, "user has to be set" unless param[:user]
      raise ArgumentError, "host has to be set" unless param[:host]
      param[:port] ||= "22"
      return "ssh #{param[:host]} -l #{param[:user]} -p #{param[:port]}"
    end

  end
end