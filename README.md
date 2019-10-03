# LAMP

Use this template to provision a classic virtual server instance (VSI) in IBM Cloud by using Terraform or IBM Cloud Schematics, and configure the instance with the components of the LAMP stack:
- Linux
- Apache
- MySQL (mariadb)
- PHP

To apply the LAMP template in IBM Cloud with IBM Cloud Schematics, you must select the template from the [IBM Cloud catalog](cloud.ibm.com/catalog/content/LAMP), enter the configuration for your classic virtual server instance, and install the template. When you install the template, IBM Cloud Schematics creates a workspace and starts provisioning your resources by using Terraform. You can review logs and your resources from the IBM Cloud Schematics console. For more information, see the [IBM Cloud Schematics documentation](https://cloud.ibm.com/docs/schematics?topic=schematics-about-schematics).

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

When you select the LAMP template from the IBM Cloud catalog, you must enter the following values before you can apply the template:

* `iaas_classic_api_key`: Enter the API key to access IBM Cloud classic infrastructure. For more information for how to create an API key and retrieve it, see [Managing classic infrastructure API keys](https://cloud.ibm.com/docs/iam?topic=iam-classic_keys).
* `iaas_classic_username`: Enter the user name to access IBM Cloud classic infrastructure. You can retrieve the user name by following the instructions for retrieving your classic infrastructure API key.
* `ssh_key`: Enter a public SSH key that you use to access your classic infrastructure virtual server instance. For more information about adding an SSH key and uploading the key to IBM Cloud, see [Adding an SSH key](https://cloud.ibm.com/docs/infrastructure/ssh-keys?topic=ssh-keys-adding-an-ssh-key).

You can also choose to customize the default settings for your classic infrastructure virtual server instance:

|Variable Name|Description|Default Value|
|-------------|-----------|-------------|
|cores|Enter the number of CPU cores that you want to allocate to your classic infrastructure virtual server instance. For supported core, run `ibmcloud sl vs options` and review the values in the **cpu (standard)** field.|1|
|datacenter|Enter the data center where you want to provision your classic infrastructure virtual server instance. For available data centers, run `ibmcloud sl vs options` and review the values in the **datacenter** field.|wdc01|
|disk_size|	Enter the numeric disk sizes in GB for the instance’s block device and disk image settings. To view available disk sizes, run `ibmcloud sl vs options` and review the values in the **san disk (0)** field. |25|
|domain|Enter the domain name that you want to assign to your classic infrastructure virtual server instance. This domain name is used with the `hostname` to create the full URL for your classic infrastructure virtual server instance.|domain.dev|
|hostname|Enter a host name for your classic infrastructure virtual server instance. This host name is used with the `domain` to create the full URL for your classic infrastructure virtual server instance.|lamp|
|memory|Enter the amount of memory in megabytes that you want to allocate to your classic infrastructure virtual server instance. To find available memory sizes, run `ibmcloud sl vs options` and review the values in the **memory** field. |1026|
|network_speed|Enter the network speed in Mbps for your classic infrastructure virtual server instance. To find available network speeds, run `ibmcloud sl vs options` and review the values in the **nic** field. |100|
|os_reference_code|Enter the reference code of the operating system that you want to install on your virtual server instance. To see available OS reference codes, log in to the [IBM Cloud Infrastructure (Classic Infrastructure) API](https://api.softlayer.com/rest/v3/SoftLayer_Virtual_Guest_Block_Device_Template_Group/getVhdImportSoftwareDescriptions.json?objectMask=referenceCode).|CENTOS_LATEST_64|
|private_network_only|Decide if you want to connect your classic infrastructure virtual server instance to a private VLAN only. Enter `true` to connect it to a private VLAN only, and `false` to connect it to a public and a private VLAN. |false|
|ssh_label|Enter a label that you want to assign to your SSH key.|public ssh key - Schematics VM|
|ssh_notes|Enter a short description that you want to add to your SSH key. ||
|ssh_user|Enter the default user name that you want to use to log in to the virtual server instance. |root|
|tags|Enter descriptive tags that you want to add to your virtual server instance. Tags can help find your resource more easily after it is created in IBM Cloud. ||

## Outputs

When you apply the template and your LAMP resource is successfully provisioned in IBM CLoud, you see the public IP address that is assigned to your virtual server instance in your Schematics log files. You can use the IP address to access your instance from the internet.

