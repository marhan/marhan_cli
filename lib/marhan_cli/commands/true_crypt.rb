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
        config = load_crypt_config
        true_crypt = TrueCryptApp.new(config.mount_folder)
        device = get_or_ask(:device)
        run true_crypt.mount_command(config.encrypted_devices[device], device)
        say "finished", :green
      rescue Exception => e
        exit_with_error(e)
      end
    end

    desc "crypt:umount", "Unmounts encrypted disk with TrueCrypt"

    method_option :device,
                  :type => :string,
                  :aliases => "-d",
                  :desc => "Name of device in configuration file."

    def umount
      begin
        config = load_crypt_config
        true_crypt = TrueCryptApp.new(config.mount_folder)
        device = get_or_ask(:device)
        run true_crypt.unmount_command(device)
        say "finished", :green
      rescue Exception => e
        exit_with_error(e)
      end
    end

    desc "crypt:umount_all", "Unmounts all encrypted disk with TrueCrypt"

    def umount_all
      begin
        true_crypt = TrueCryptApp.new
        run true_crypt.unmount_all_command
        say "finished", :green
      rescue Exception => e
        exit_with_error(e)
      end
    end

    protected

    def load_crypt_config
      load_config.crypt
    end
  end
end
