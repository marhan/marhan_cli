require 'thor'
require 'thor/runner'

module MarhanCli

  def self.start
    require_commands
    run_thor
  end

  private

  def self.require_commands
    path_to_commands = File.expand_path '../marhan_cli/commands/*.rb', __FILE__
    Dir[path_to_commands].each do |f|
      require f
    end
  end

  def self.run_thor
    Thor.default_task 'list'
    Thor::Runner.start
  end

end

