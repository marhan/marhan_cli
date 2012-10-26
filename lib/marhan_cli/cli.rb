require "thor"
require 'marhan_cli/cli/server/remote_machine'

module MarhanCli
  class Cli < Thor

  end
end

require "marhan_cli/cli/commands/server"
require "marhan_cli/cli/commands/internet"