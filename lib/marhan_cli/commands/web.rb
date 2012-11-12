# encoding: utf-8
require 'net/http'
require 'marhan_cli/command'

module MarhanCli
  class Web < MarhanCli::Command

    namespace :web

    desc "web:my-ip", "Gives out the external IP from the world wide web"

    def my_ip
      uri = URI('http://checkip.dyndns.org')
      response = Net::HTTP.get(uri)
      ip_address = /[0-9\.]+/.match(response)
      say("Your public IP is: #{ip_address}", :blue)
    end

  end
end