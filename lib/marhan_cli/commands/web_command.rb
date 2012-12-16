# encoding: utf-8
require 'net/http'
require 'marhan_cli/command'

module MarhanCli
  class WebCommand < MarhanCli::Command

    namespace :web

    desc "web:myip", "Gives out the external IP from the world wide web"

    def myip
      execute my_ip_proc()
    end

    private

    def my_ip_proc
      Proc.new do
        uri = URI('http://checkip.dyndns.org')
        response = Net::HTTP.get(uri)
        ip_address = /[0-9\.]+/.match(response)
        say("Your public IP is: #{ip_address}", :cyan)
      end
    end

  end
end