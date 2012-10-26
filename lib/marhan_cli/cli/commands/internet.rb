module MarhanCli
  class Cli
    include Thor::Actions

    desc "my-net-ip", "Gives out the external IP from the world wide web"

    def my_net_ip
      cmd = "curl -s checkip.dyndns.org | grep -Eo '[0-9\.]+'"
      res = `#{cmd}`
      say("Your public IP is: #{res}", :blue)
    end

  end
end