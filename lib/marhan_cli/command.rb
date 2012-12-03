# encoding: utf-8
require "thor"
require "ambience"

module MarhanCli
  class Command < Thor
    include Thor::Actions

    protected

    CONFIG_FILE = ".marhan_cli.yml"

    def execute(proc)
      begin
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
      config_file_path = File.join(File.expand_path("~/"), CONFIG_FILE)
      unless File.exists?(config_file_path)
        raise "Stop processing! Command needs the configuration file '#{CONFIG_FILE}' in you're home directory."
      end
      #say "I will use the '#{CONFIG_FILE}' configuration file in you're home directory.", :cyan
      config = Ambience.create(config_file_path)
      config.to_mash
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