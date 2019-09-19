################################################################
# Module to deploy an VM with specified applications installed
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Licensed Materials - Property of IBM
#
# ©Copyright IBM Corp. 2017.
#
################################################################
variable "hostname" {
  default = "lamp"
  description = "Enter a host name for your classic infrastructure virtual server instance. This host name is used with the `domain` to create the full URL for your classic infrastructure virtual server instance."
}
variable "domain" {
  default = "domain.dev"
  description = "Enter the domain name that you want to assign to your classic infrastructure virtual server instance. This domain name is used with the `hostname` to create the full URL for your classic infrastructure virtual server instance."
}
variable "datacenter" {
  default = "wdc01"
  description = "Enter the data center where you want to provision your classic infrastructure virtual server instance. For available data centers, run `ibmcloud sl vs options` and review the values in the 'datacenter' field."
}
variable "os_reference_code" {
  default = "CENTOS_LATEST_64"
  description = "Enter the reference code of the operating system that you want to install on your virtual server instance. To see available OS reference codes, log in to the [IBM Cloud Infrastructure (SoftLayer) API](https://api.softlayer.com/rest/v3/SoftLayer_Virtual_Guest_Block_Device_Template_Group/getVhdImportSoftwareDescriptions.json?objectMask=referenceCode)."
}
variable "cores" {
  default = "1"
  description = "Enter the number of CPU cores that you want to allocate to your classic infrastructure virtual server instance. For supported core, run `ibmcloud sl vs options` and review the values in the 'cpu (standard)' field."
}
variable "memory" {
  default = "1024"
  description = "Enter the amount of memory in megabytes that you want to allocate to your classic infrastructure virtual server instance. To find available memory sizes, run `ibmcloud sl vs options` and review the values in the 'memory' field. "
}
variable "disk_size" {
  default = "25"
  description = "Enter the numeric disk sizes in GB for the instance’s block device and disk image settings. To view available disk sizes, run `ibmcloud sl vs options` and review the values in the 'san disk (0)' field. "
}
variable "private_network_only" {
  default = "false"
  description = "Decide if you want to connect your classic infrastructure virtual server instance to a private VLAN only. Enter `true` to connect it to a private VLAN only, and `false` to connect it to a public and a private VLAN."
}
variable "network_speed" {
  default = "100"
  description = "The connection speed in Mbps for the instance’s network components."
}
variable "tags" {
  default = "lamp"
  description = "Add descriptive tags to label the resource.  A tag is a label that you assign to a resource for easy filtering of resources in your resource list."
}

variable "ssh_user" {
  default = "root"
  description = "The default user name for the virtual machine, for example, the "root" user for UNIX operating systems."
}
variable "ssh_label" {
  default = "public ssh key"
  description = "An identifying label to assign to the SSH key."
}
variable "ssh_notes" {
  default = ""
  description = "A description to assign to the SSH key."
}
variable "ssh_key" {
  default = ""
  description = "Your public SSH key to access the virtual machine. Your public key is saved to a file called `id_rsa.pub` in the `.ssh` subdirectory of your home directory."
}

resource "ibm_compute_ssh_key" "ssh_key" {
    label = "${var.ssh_label}"
    notes = "${var.ssh_notes}"
    public_key = "${var.ssh_key}"
}

resource "ibm_compute_vm_instance" "vm" {
  hostname                 = "${var.hostname}"
  os_reference_code        = "${var.os_reference_code}"
  domain                   = "${var.domain}"
  datacenter               = "${var.datacenter}"
  network_speed            = "${var.network_speed}"
  hourly_billing           = true
  private_network_only     = "${var.private_network_only}"
  cores                    = "${var.cores}"
  memory                   = "${var.memory}"
  disks                    = ["${var.disk_size}"]
  dedicated_acct_host_only = true
  local_disk               = false
  ssh_key_ids              = ["${ibm_compute_ssh_key.ssh_key.id}"]
  tags                     = ["${var.tags}"]
  user_metadata            = "${file("install.yml")}"
}

output "public_ip" {
	value = "http://${ibm_compute_vm_instance.vm.ipv4_address}"
}
