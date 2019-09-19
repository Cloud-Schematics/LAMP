# LAMP

Use this template to provision a classic virtual server instance (VSI) in IBM Cloud by using Terraform or IBM Cloud Schematics, and configure the instance with the components of the LAMP stack: 
- Linux
- Apache
- MySQL (mariadb)
- PHP

To apply the LAMP template in IBM Cloud with IBM Cloud Schematics, you must select the template from the [IBM Cloud catalog](cloud.ibm.com/catalog/content/LAMP), enter the configuration for your classic virtual server instance, and install the template. When you install the template, IBM Cloud Schematics creates a workspace that points to this GitHub repository and starts provisioning your resources by using Terraform. You can review logs and your resources from the IBM Cloud Schematics console. For more information, see the [IBM Cloud Schematics documentation](https://cloud.ibm.com/docs/schematics?topic=schematics-about-schematics). 

For more information about IBM Cloud classic virtual service instances, see [Getting started with virtual servers](https://cloud.ibm.com/docs/vsi?topic=virtual-servers-getting-started-tutorial). 

## Costs

When you apply this template, you are charged for the classic virtual server instance that you configure. The price for your instance depends on your instance configuration. Make sure to review available [plans](https://www.ibm.com/cloud/virtual-servers/calculator/) before you apply this template in IBM Cloud. By default, your instance is provisioned with an hourly billing. 

**Note**: You can remove your virtual server instance and the LAMP stack by [deleting your Schematics workspace or your instance](https://cloud.ibm.com/docs/schematics?topic=schematics-manage-lifecycle#destroy-resources) with IBM Cloud Schematics. Removing the workspace or the instance cannot be undone. Make sure that you back up any data that you must keep before you start the deletion process. 

## Dependencies

Before you can apply the template in IBM Cloud, you must have the following permissions in IBM Cloud Identity and Access Management: 
- **Manager** service access role for IBM Cloud Schematics
- **Add Server** and **Cancel Server** classic infrastructure permissions that you can find in the **Account** permission set
- All permissions that are included in the **Devices** classic infrastructure permission set
- **Add Compute with Public Network Port** classic infrastructure permission that you can find in the **Network** permission set

## Configuring your deployment values



Set the following variables before you use the template:

### Required values

When you select the LAMP template from the IBM Cloud catalog, you must enter the following values before you can apply the template: 

* `softlayer_api_key`: Enter the API key to access IBM Cloud classic infrastructure. For more information for how to create an API key and retrieve it, see [Managing classic infrastructure API keys](https://cloud.ibm.com/docs/iam?topic=iam-classic_keys). 
* `softlayer_username`: Enter the user name to access IBM Cloud classic infrastructure. You can retrieve the user name by following the instructions for retrieving your classic infrastructure API key. 
* `ssh_key`: Enter a public SSH key that you use to access your classic infrastructure virtual server instance. For more information about adding an SSH key and uploading the key to IBM Cloud, see [Adding an SSH key](https://cloud.ibm.com/docs/infrastructure/ssh-keys?topic=ssh-keys-adding-an-ssh-key). 

### Optional values

Before you apply the template in IBM Cloud, you can choose to customize the following default values: 

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
|tags|Add descriptive tags to label the resource. A tag is a label that you assign to a resource for easy filtering of resources in your resource list.||
## Outputs

This template outputs the IPv4 address of the created virtual machine.

