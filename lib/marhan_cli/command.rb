# encoding: utf-8
require "thor"

module MarhanCli
  class Command < Thor
    include Thor::Actions

    protected

    def exit_with_error(message)
      raise Thor::Error, message
    end

  end
end