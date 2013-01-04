# encoding: utf-8
require "ambience"

module MarhanCli
  class Config

    def self.init()
      ENV['MARHAN_CLI_CONFIG'] ||= default_config_file
      @config_file = ENV['MARHAN_CLI_CONFIG']
      load_config(@config_file)
    end

    def self.load_config(config_file)
      unless File.exists?(config_file)
        raise "Stop processing! Command not found configuration file '#{config_file}."
      end
      begin
        Ambience.create(config_file).to_mash
      rescue Exception => e
        raise "Configuration file could not pared: #{e}"
      end
    end

    def self.default_config_file
      File.expand_path(File.join(Dir.home, ".marhan_cli.yml"))
    end

  end
end