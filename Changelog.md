## v0.0.1

* Initial release
* Copy the ssh id file into the ~/.ssh/authorized_keys of a remote machine. (command => add-ssh-key)

## v0.0.2

* Output improved. (command => add-ssh-key)

## v0.0.4

* Retrieves the external ip address from the world wide web. (command => my-net-ip)

## v0.0.5

* Add MarhanCli command list as default task list to Thor.
* Introduce namespaces to commands. Building Groups with the namespaces 'web' and 'net'.
* Command names renamed:
    **my-net-ip** renamed to **web:my-ip**
    **add-ssh-key** renamed to **net:add-ssh-key**

## v0.0.6

* TrueCrypt command added.
* Mount and unmount commands for private hard disk added.

## v0.0.7

* TrueCrypt command for unmount all devices added.
* Expect configuration file '.marhan_cli.yaml' in home directory to define encrypted devices and mount folder.

## v0.0.8

* Name (configuration key) of device as parameter of mount command. (command => crypt:mount)

## v0.0.9

* Name (configuration key) of device as parameter of unmount command. (command => crypt:unmount)

## v0.0.10

* Refactorings for cleaner code.

## v0.0.11

* First RSpec tests and guard added for TDD development.
* VirtualBox command for start and stop virtual guest systems added. (command => vbox:[start|stop])

## v0.0.12

* VirtualBox command connects automatically to ssh server, if guest configuration has 'ssh' connection data. (command => vbox:start)
* 'VBoxManage controlvm ' uses 'acpipowerbutton' instead of 'poweroff', now. (command => vbox:stop)

## v0.0.13

* Configuration file will be used completely. 'SSH' configuration was ignored.

## v0.0.14

* Internal refactorings and improvements.

## v0.0.15

* New command added for starting and stopping services. (command => serv:[start|stop])
* This command supports only the CI Server Jenkins, at the moment.

## v0.0.16

* Internal refactorings and improvements.