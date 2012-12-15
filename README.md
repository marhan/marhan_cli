# MarhanCli [![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/marhan/marhan_cli)

This gem is a console tool for my own needs.

## Installation

Add this line to your application's Gemfile:

    gem 'marhan_cli'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install marhan_cli

## Usage

Ater installation of the gem type `mcli` to get a list of possible commands

    $ mcli

Configuration file `~/.marhan_cli.yml` is used for several commands

    crypt:
      mount_folder: /Volumes
      encrypted_devices:
        enc1: /dev/rdisk1s2
        hdd: /dev/rdisk2s2
    vbox:
      guests:
        linux: Linux
        windows: Windows XP

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
