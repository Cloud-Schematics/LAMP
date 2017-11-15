variable "softlayer_username" {
  description = "Your IBM Cloud Infrastructure (SoftLayer) user name."
}
variable "softlayer_api_key" {
  description = "Your IBM Cloud Infrastructure (SoftLayer) API key."
}

provider "ibm" {
  softlayer_username = "${var.softlayer_username}"
  softlayer_api_key = "${var.softlayer_api_key}"
}
