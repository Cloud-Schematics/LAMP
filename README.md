# LAMP Template

An IBM Cloud Schematics template to provision a virtual machine instance and configure it with the "LAMP" stack: Linux, Apache, MySQL (mariadb), and PHP. Schematics uses [Terraform](https://www.terraform.io/) as the infrastructure as code engine. With this template, you can provision and manage infrastructure as a single unit.

See the IBM Cloud docs for more information about [Schematics](https://cloud.ibm.com/docs/schematics).

## Costs

This sample uses chargable services and **will** incur costs for the time the services are deployed. Execution of `terraform destroy` will result in deletion of all resources including the ICD service instance. Billing for VSIs and ICD will terminate on the hour. 

## Dependencies

- User has IAM security rights to create and configure an IBM Cloud Database instance and VSIs

## Identity &amp; Access Management (IAM) Permissions 

The following variables need to be set before use

* `softlayer_username` is an Infrastructure user name. Go to https://cloud.ibm.com/iam/users/, select the user, scroll down and check username under VPN password.
* `softlayer_api_key` is an Infrastructure API Key. Go to https://cloud.ibm.com/iam/users/, select the user, scroll down and check Classic infrastructure API key under API keys. If you don't have one already, go to https://cloud.ibm.com/iam/#/apikeys and create a new Classic infrastructure key.

### Variables

|Variable Name|Description|Default Value|
|-------------|-----------|-------------|
|cores|The number of CPU cores to allocate.|1|
|datacenter|The data center to create resources in. You can get the list by running `ibmcloud cs locations`.|wdc01|
|disk_size|The numeric disk sizes (in GB) for the instance’s block device and disk image settings.|25|
|domain|The domain for the instance.|domain.dev|
|hostname|The hostname for the instance.|lamp|
|memory|The amount of memory, expressed in megabytes, to allocate.|1026|
|network_speed|The connection speed (in Mbps) for the instance’s network components.|100|
|os_reference_code|The operating system reference code that is used to provision the computing instance. To see available OS reference codes, log in to the [IBM Cloud Infrastructure (SoftLayer) API](https://api.softlayer.com/rest/v3/SoftLayer_Virtual_Guest_Block_Device_Template_Group/getVhdImportSoftwareDescriptions.json?objectMask=referenceCode).|CENTOS_LATEST_64|
|private_network_only|When set to true, a compute instance only has access to the private network.|false|
|softlayer_api_key|Your IBM Cloud Infrastructure (SoftLayer) API key.||
|softlayer_username|Your IBM Cloud Infrastructure (SoftLayer) user name.||
|ssh_key|Your public SSH key to access the VM.||
|ssh_label|An identifying label to assign to the SSH key.|public ssh key - Schematics VM|
|ssh_notes|A description to assign to the SSH key.||
|ssh_user|The provisioning username.|root|
|tags|Descriptive tags to label the resource.||

## Outputs

This template outputs the IPv4 address of the created virtual machine

