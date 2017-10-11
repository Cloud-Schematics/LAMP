# LAMP Template

This template deploys a virtual machine instance and provisions Apache, MySQL (mariadb), and PHP onto that instance. 

## Using This Template

In Schematics, add the following variables: `public_key`, `temp_public_key`, and `temp_private_key`.

To use the Schematics-generated keypair for the environment, set `temp_public_key` to `$SCHEMATICS.SSHKEYPUBLIC` and set `temp_private_key` to `$SCHEMATICS.SSHKEYPRIVATE`. 

If you want to be able to use an SSH key to access the virtual machine, provide your public SSH key as the value for `public_key`.

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
