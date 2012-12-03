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
      execute mount_proc
    end

    desc "crypt:umount", "Unmounts encrypted disk with TrueCrypt"

    method_option :device,
                  :type => :string,
                  :aliases => "-d",
                  :desc => "Name of device in configuration file."

    def umount
      execute unmount_proc
    end

    desc "crypt:umount_all", "Unmounts all encrypted disk with TrueCrypt"

    def umount_all
      execute unmount_all_proc
    end

    private

    def mount_proc
      Proc.new do
        config = load_crypt_config
        true_crypt = TrueCryptApp.new(config.mount_folder)
        device = get_or_ask(:device)
        run true_crypt.mount_command(config.encrypted_devices[device], device)
      end
    end

    def unmount_proc
      Proc.new do
        config = load_crypt_config
        true_crypt = TrueCryptApp.new(config.mount_folder)
        device = get_or_ask(:device)
        run true_crypt.unmount_command(device)
      end
    end

    def unmount_all_proc
      Proc.new do
        true_crypt = TrueCryptApp.new
        run true_crypt.unmount_all_command
      end
    end

    def load_crypt_config
      load_config.crypt
    end
  end
end
