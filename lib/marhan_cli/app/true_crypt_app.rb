# encoding: utf-8

module MarhanCli
  class TrueCryptApp

    def initialize(mount_folder = nil)
      @binary = "/Applications/TrueCrypt.app/Contents/MacOS/TrueCrypt"
      raise ArgumentError, "No installation of TrueCrypt found!" unless File.exist? @binary
      @mount_folder = mount_folder
    end

    def mount_command(encrypted_device, mount_to_folder)
      "#{@binary} --mount #{encrypted_device} #{@mount_folder}/#{mount_to_folder}"
    end

    def unmount_command()
      "#{@binary} -d #{@mount_folder}/enc1"
    end

    def mount_folder
      raise ArgumentError, "No mount folder defined! Don't know where to mount!" unless @mount_folder
      @mount_folder
    end

    def unmount_all_command()
      "#{@binary} -d"
    end

  end
end
