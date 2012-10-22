module MarhanCli
  class Cli
    include Thor::Actions

    desc "add_ssh_key", "Copies public ssh key into authorized_keys"

    def add_ssh_key(user, password, host)
      #https://gist.github.com/1639381
      say ""
      run "ssh -l #{user} -L#{host} -p 2222 || ls"
    end
  end
end