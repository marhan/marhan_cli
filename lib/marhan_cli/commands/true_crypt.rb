# encoding: utf-8
require 'marhan_cli/command'
require 'marhan_cli/app/true_crypt_app'

module MarhanCli
  class TrueCrypt < MarhanCli::Command

    namespace :crypt

    desc "crypt:mount", "Mounts encrypted disk with TrueCrypt"

    method_option :device,
                  :type => :string,
                  :aliases => "-d",
                  :desc => "Name of device in configuration file."

    def mount
      begin
        config = load_config
        device = get_or_ask(:device)
        @app = TrueCryptApp.new(config.crypt.mount_folder)
        run @app.mount_command(config.crypt.encrypted_devices[device], device)
        say "finished", :green
      rescue Exception => e
        exit_with_error(e)
      end
    end

    desc "crypt:umount", "Unmounts encrypted disk with TrueCrypt"

    def unmount
      begin
        config = load_config
        @app = TrueCryptApp.new(config.crypt.mount_folder)
        run @app.unmount_command
        say "finished", :green
      rescue Exception => e
        exit_with_error(e)
      end
    end

    desc "crypt:umount_all", "Unmounts all encrypted disk with TrueCrypt"

    def umount_all
      begin
        @app = TrueCryptApp.new
        run @app.unmount_all_command
        say "finished", :green
      rescue Exception => e
        exit_with_error(e)
      end
    end
  end
end
