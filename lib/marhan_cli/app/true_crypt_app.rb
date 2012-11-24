# encoding: utf-8

module MarhanCli
  class TrueCryptApp

    @@binary = "/Applications/TrueCrypt.app/Contents/MacOS/TrueCrypt"

    def initialize()
      raise ArgumentError, "No installation of TrueCrypt found!" unless File.exist? @@binary
    end

    def mount_command()
      "#{@@binary} --mount /dev/rdisk1s2 /Volumes/enc1"
    end

    def unmount_command()
      "#{@@binary} -d /Volumes/enc1"
    end

    def unmount_all_command()
      "#{@@binary} -d"
    end

  end
end
