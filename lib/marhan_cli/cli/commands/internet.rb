require 'net/http'

module MarhanCli
  class Cli
    include Thor::Actions

    desc "my-net-ip", "Gives out the external IP from the world wide web"

    def my_net_ip
      uri = URI('http://checkip.dyndns.org')
      response = Net::HTTP.get(uri)
      ip_address = /[0-9\.]+/.match(response)
      say("Your public IP is: #{ip_address}", :blue)
    end

  end
end