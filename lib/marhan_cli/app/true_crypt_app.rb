# encoding: utf-8

module MarhanCli
  class TrueCryptApp

    def initialize(mount_folder = nil)
      @binary = "/Applications/TrueCrypt.app/Contents/MacOS/TrueCrypt"
      raise ArgumentError, "No installation of TrueCrypt found!" unless File.exist? @binary
      @mount_folder = mount_folder
    end

    def mount_command(encrypted_devices)
      "#{@binary} --mount #{encrypted_devices[:enc1]} #{mount_folder}/#{:enc1.to_s}"
    end

    def unmount_command()
      "#{@binary} -d #{mount_folder}/enc1"
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
