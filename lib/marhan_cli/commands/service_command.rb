# encoding: utf-8
require 'marhan_cli/command'
require 'marhan_cli/apps/jenkins'

module MarhanCli
  class ServiceCommand < MarhanCli::Command

    namespace :serv

    desc "serv:start", "Starts Jenkins as a service"

    def start
      execute start_service
    end


    desc "serv:stop", "Stops Jenkins as a service"

    def stop
      execute stop_service
    end

    private

    def start_service
      Proc.new do
        run Jenkins.new.start_command
      end
    end

    def stop_service
      Proc.new do
        run Jenkins.new.stop_command
      end
    end

  end

end
