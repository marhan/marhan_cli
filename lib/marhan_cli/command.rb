# encoding: utf-8
require "thor"

module MarhanCli
  class Command < Thor
    include Thor::Actions

    protected

    def exit_command(message)
      say message, :red
      exit(1)
    end

  end
end