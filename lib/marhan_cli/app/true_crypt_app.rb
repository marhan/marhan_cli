require 'marhan_cli/helper/constraint'

module MarhanCli
  class TrueCryptApp

    def initialize()
      @binary = "/Applications/TrueCrypt.app/Contents/MacOS/TrueCrypt"
    end

    def mount_command()
      "#{@binary} --mount /dev/rdisk1s2 /Volumes/enc1"
    end

    def unmount_command()
      "#{@binary} -d /Volumes/enc1"
    end

  end
end
