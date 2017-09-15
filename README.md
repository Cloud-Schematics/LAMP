# LAMP Template

This template allocates a virtual machine instance and provisions Apache, MySQL (mariadb), and PHP onto that instance. 

## Using This Template

In Schematics create variables `softlayer_username`, `softlayer_api_key`, `public_key`, `temp_public_key`, and `temp_private_key`.

Set `temp_public_key` to `$SCHEMATICS.SSHKEYPUBLIC` to use the Schematics generated keypair for the environment. Set `temp_private_key` to `$SCHEMATICS.SSHKEYPRIVATE` to use the Schematics generated keypair for the environment. 

If you want to be able to SSH into the virtual machine provide a value for `public_key`

## Variables

|Variable Name|Description|Default Value|
|-------------|-----------|-------------|
|hostname     |           |hostname|
|domain       |           |domain.dev|
|datacenter   |           |wdc01|
|os_reference_code||CENTOS_7|
|cores|CPU cores|1|
|memory||1026|
|disk_size|in GB|25|
|private_network_only||false|
|network_speed||100|
|tags|||
|ssh_user|provisioning username|root|
|ssh_label||public ssh key - Schematics VM|
|ssh_notes|||
|public_key|your public SSH key to use for access to virtual machine||
