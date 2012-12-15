# encoding: utf-8
require "thor"
require "ambience"
require 'marhan_cli/config'

module MarhanCli
  class Command < Thor
    include Thor::Actions

    protected

    def execute(proc)
      begin
        say ""
        say "Starting command...", :green
        say ""
        proc.call
        say ""
        say "End of command", :green
      rescue Exception => e
        exit_with_error(e)
      end
    end

    def exit_with_error(message)
      say message, :red
      exit(1)
    end

    def load_config
      Config.init
    end

    def get_or_ask(option_name)
      options[option_name] || ask_for_option(option_name)
    end

    def ask_for_option(option)
      value = ask("Please enter #{option}:")
      raise Thor::Error, "You must enter a value for that field." if value.empty?
      value
    end
  end
end