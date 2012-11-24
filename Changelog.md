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