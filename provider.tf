variable "softlayer_username" {
  description = "Enter your classic infrastructure (SoftLayer) full user name. Go to https://cloud.ibm.com/iam/users/, select your name, and get your user name from the VPN password section."
}
variable "softlayer_api_key" {
  description = "Enter your classic infrastructure API key. Go to https://cloud.ibm.com/iam/apikeys to get the details of an existing API key or create a new one."
}

provider "ibm" {
  softlayer_username = "${var.softlayer_username}"
  softlayer_api_key = "${var.softlayer_api_key}"
}
