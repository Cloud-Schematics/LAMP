# LAMP Template

An IBM Cloud Schematics template to provision a virtual machine instance and provision Apache, MySQL (mariadb), and PHP onto that instance. Schematics uses [Terraform](https://www.terraform.io/) as the infrastructure as code engine. With this template, you can provision and manage infrastructure as a single unit. **Note**: To create the resources that this template requests, your [IBM Cloud Infrastructure (Softlayer) account](https://console.bluemix.net/docs/iam/mnginfra.html#managing-infrastructure-access) and [IBM Cloud account](https://console.bluemix.net/docs/iam/mngiam.html#iammanidaccser) must have sufficient permissions. 

See the IBM Cloud docs for more information about [Schematics](https://console.bluemix.net/docs/services/schematics/index.html) and the [IBM Cloud Container Service](https://console.bluemix.net/docs/containers/container_index.html).

## Create an environment with this template

Environments can be used to separate software components into development tiers (e.g. staging, QA, and production).

1. In IBM Cloud, go to the menu and select the [Schematics dashboard](https://console.bluemix.net/schematics).
2. In the left navigation menu, select **Templates** to access the template catalog.
3. Click **Create** on the containers cluster template. You are taken to a configuration page where you can define data about your environment.
4. To use the Schematics-generated keypair for the environment, add the following variables: `temp_public_key` and `temp_private_key`. Set `temp_public_key` to `$SCHEMATICS.SSHKEYPUBLIC` and set `temp_private_key` to `$SCHEMATICS.SSHKEYPRIVATE.
5. If you want to be able to use an SSH key to access the virtual machine, provide your public SSH key as the value for `ssh_key`.
6. Define values for your remaining variables according to the following table.

### Variables

|Variable Name|Description|Default Value|
|-------------|-----------|-------------|
|cores|The number of CPU cores to allocate.|1|
|datacenter|The data center to create resources in. You can get the list by running `bluemix cs locations`.|wdc01|
|disk_size|The numeric disk sizes (in GB) for the instance’s block device and disk image settings.|25|
|domain|The domain for the instance.|domain.dev|
|hostname|The hostname for the instance.|hostname|
|memory|The amount of memory, expressed in megabytes, to allocate.|1026|
|network_speed|The connection speed (in Mbps) for the instance’s network components.|100|
|os_reference_code|The operating system reference code that is used to provision the computing instance. To see available OS reference codes, log in to the [IBM Cloud Infrastructure (SoftLayer) API](https://api.softlayer.com/rest/v3/SoftLayer_Virtual_Guest_Block_Device_Template_Group/getVhdImportSoftwareDescriptions.json?objectMask=referenceCode).|CENTOS_7|
|private_network_only|When set to true, a compute instance only has access to the private network.|false|
|softlayer_api_key|Your IBM Cloud Infrastructure (SoftLayer) API key.||
|softlayer_username|Your IBM Cloud Infrastructure (SoftLayer) user name.||
|ssh_key|Your public SSH key to access the VM.||
|ssh_label|An identifying label to assign to the SSH key.|public ssh key - Schematics VM|
|ssh_notes|A description to assign to the SSH key.||
|ssh_user|The provisioning username.|root|
|tags|Descriptive tags to label the resource.||

## Next steps

After setting up your environment with this template, you can run **Plan** to preview how Schematics will deploy resources (in this case, a Kubernetes cluster) to your environment. When you are ready to deploy the cluster, run **Apply**.
