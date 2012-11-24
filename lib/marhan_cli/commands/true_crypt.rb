# encoding: utf-8
require 'marhan_cli/command'
require 'marhan_cli/app/true_crypt_app'

module MarhanCli
  class TrueCrypt < MarhanCli::Command

    namespace :crypt

    desc "crypt:mount", "Mounts encrypted disk with TrueCrypt"

    def mount
      begin
        @app = TrueCryptApp.new
        run @app.mount_command
        say "finished", :green
      rescue Exception => e
        exit_with_error("Failed: #{e}")
      end
    end

    desc "crypt:umount", "Unmounts encrypted disk with TrueCrypt"

    def unmount
      begin
        @app = TrueCryptApp.new
        run @app.unmount_command
        say "finished", :green
      rescue Exception => e
        exit_with_error("Failed: #{e}")
      end
    end

    desc "crypt:umount_all", "Unmounts all encrypted disk with TrueCrypt"

    def umount_all
      begin
        @app = TrueCryptApp.new
        run @app.unmount_all_command
        say "finished", :green
      rescue Exception => e
        exit_with_error("Failed: #{e}")
      end
    end

  end
end
