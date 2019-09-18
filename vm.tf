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
  description = "The hostname for the instance, for example, vm1."
}
variable "domain" {
  default = "domain.dev"
  description = "The domain for the instance, for example, domain.dev."
}
variable "datacenter" {
  default = "wdc01"
  description = "The data center to create resources in, for example, dal13. To get a list of all data centers, run the `ic sl vs options` command."
}
variable "os_reference_code" {
  default = "CENTOS_LATEST_64"
  description = "The code that is used to provision the computing instance. To view the available OS reference codes, log in to the [IBM Cloud Infrastructure (SoftLayer) API](https://api.softlayer.com/rest/v3/SoftLayer_Virtual_Guest_Block_Device_Template_Group/getVhdImportSoftwareDescriptions.json?objectMask=referenceCode)."
}
variable "cores" {
  default = "1"
  description = "The number of CPU cores to allocate."
}
variable "memory" {
  default = "1024"
  description = "The amount of memory in MB to allocate."
}
variable "disk_size" {
  default = "25"
  description = "The numeric disk sizes in GB for the instance’s block device and disk image settings."
}
variable "private_network_only" {
  default = "false"
  description = "Enter true or false. True means a compute instance has access only to the private network."
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
