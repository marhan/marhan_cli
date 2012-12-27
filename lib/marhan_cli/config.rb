# encoding: utf-8
require "ambience"

module MarhanCli
  class Config

    def self.init(config_file = nil)
      @config_file = config_file || default_config_file
      load_config(@config_file)
    end

    def self.load_config(config_file)
      unless File.exists?(config_file)
        raise "Stop processing! Command needs the configuration file '#{config_file}' in you're home directory."
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