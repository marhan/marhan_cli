# encoding: utf-8
require "thor"
require "ambience"

module MarhanCli
  class Command < Thor
    include Thor::Actions

    protected

    CONFIG_FILE = ".marhan_cli.yml"

    def exit_with_error(message)
      say message, :red
      exit(1)
    end

    def load_config
      config_file_path = File.join(File.expand_path("~/"), CONFIG_FILE)
      unless File.exists?(config_file_path)
        raise "Stop processing! Command needs the configuration file '#{CONFIG_FILE}' in you're home directory."
      end
      say "I will use the '#{CONFIG_FILE}' configuration file in you're home directory.", :cyan
      config = Ambience.create(config_file_path)
      config.to_mash
    end
  end
end