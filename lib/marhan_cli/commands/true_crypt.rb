# encoding: utf-8
require 'marhan_cli/command'
require 'marhan_cli/app/true_crypt_app'

module MarhanCli
  class TrueCrypt < MarhanCli::Command

    namespace :true_crypt

    desc "true_crypt:mount", "Mounts encrypted disk with TrueCrypt"

    def mount
      say "Mount disk", :green
      run TrueCryptApp.new.mount_command
    end

    desc "true_crypt:unmount", "Unmounts encrypted disk with TrueCrypt"

    def unmount
      say "unmount disk", :green
      run TrueCryptApp.new.unmount_command
    end

  end
end
