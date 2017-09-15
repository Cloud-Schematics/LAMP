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
  default = "hostname"
}
variable "domain" {
  default = "domain.dev"
}
variable "datacenter" {
  default = "wdc01"
}
variable "os_reference_code" {
  default = "CENTOS_7"
}
variable "cores" {
  default = "1"
}
variable "memory" {
  default = "1024"
}
variable "disk_size" {
  default = "25"
}
variable "private_network_only" {
  default = "false"
}
variable "network_speed" {
  default = "100"
}
variable "tags" {
  default = ""
}

variable "ssh_user" {
  default = "root"
  description = "default user for VM"
}
variable "ssh_label" {
  default = "public ssh key - Schematics VM"
}
variable "ssh_notes" {
  default = ""
}
variable "ssh_key" {
  default = ""
  description = "public SSH key to use in keypair"
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
