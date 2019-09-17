# LAMP template

The LAMP template is an IBM Cloud Schematics template that is used to create a virtual server instance (VSI) and configure it with the "LAMP" stack: Linux, Apache, MySQL (mariadb), and PHP. Schematics uses [Terraform](https://www.terraform.io/) as the infrastructure-as-code engine. With this template, you can create and manage infrastructure as a single unit.

For more information about how to use the template, go to the documentation for [IBM Cloud Schematics](https://cloud.ibm.com/docs/schematics).

## Costs

This sample uses chargeable services and you are charged for the time the services are deployed. Running the `terraform destroy` command deletes all resources, including the IBM Cloud database service instance. Billing for virtual server instances (VSIs) and IBM Cloud database terminates on the hour. 

## Dependencies

The user must have Identity and Access Management (IAM) access to create and configure an IBM Cloud database instance and VSIs.

## Configuring your deployment values

The following variables need to be set before you can use the template: 

* `softlayer_username` is a the infrastructure user name. Go to **Access (IAM) > Users**, and select your name. Then, verify the user name is listed in the VPN password section.
* `softlayer_api_key` is a classic infrastructure API key. Go to **Access (IAM) > Users**, and select your name. Then, verify that a classic infrastructure API key is included in the API keys section. If you don't have one already, you can create one from theh [IBM Cloud API keys page](https://cloud.ibm.com/iam/apikeys).

You must also set the following deployment values on the Create page. You can enter customized values or accept the defaults.

|Variable Name|Description|Default Value|
|-------------|-----------|-------------|
|cores|The number of CPU cores to allocate.|1|
|datacenter|The data center to create resources in, for example, dal13. To get a list of all data centers, run the `ic sl vs options` command.|wdc01|
|disk_size|The numeric disk sizes in GB for the instance’s block device and disk image settings.|25|
|domain|The domain for the instance, for example, domain.dev|domain.dev|
|hostname|The hostname for the instance, for example, vm1|lamp|
|memory|The amount of memory in MB to allocate.|1026|
|network_speed|The connection speed in Mbps for the instance’s network components.|100|
|os_reference_code|The code that is used to provision the computing instance. To see available OS reference codes, log in to the [IBM Cloud Infrastructure (SoftLayer) API](https://api.softlayer.com/rest/v3/SoftLayer_Virtual_Guest_Block_Device_Template_Group/getVhdImportSoftwareDescriptions.json?objectMask=referenceCode).|CENTOS_LATEST_64|
|private_network_only|Enter true or false. True means a compute instance has access only to the private network.|false|
|softlayer_api_key|Enter your classic infrastructure API key. See the [IBM Cloud API keys page](https://cloud.ibm.com/iam/apikeys) to get the details of an existing API key or to create a new one.||
|softlayer_username|Enter your classic infrastructure user name. Go to **Access (IAM) > Users**, and select your name. Then, locate your user name from the VPN password section. ||
|ssh_key|Your public SSH key to access the virtual machine. Your public key is saved to a `id_rsa.pub` file in the `.ssh` subdirectory of your home directory.||
|ssh_label|An identifying label to assign to the SSH key.|public ssh key - Schematics VM|
|ssh_notes|A description to assign to the SSH key.||
|ssh_user|The default user name for the virtual machine, for example, the "root" user for UNIX operating systems. |root|
|tags|Add descriptive tags to label the resource.  A tag is a label that you assign to a resource for easy filtering of resources in your resource list.||
## Outputs

This template outputs the IPv4 address of the created virtual machine.

