variable "softlayer_username" {
  description = "Enter your classic infrastructure user name. Go to **Access(IAM)** > **Users**, and select your name. Then, find your user name in the VPN password section"
}
variable "softlayer_api_key" {
  description = "Enter your classic infrastructure API key. Go to the [IBM Cloud API keys page] (https://cloud.ibm.com/iam/apikeys) to get the details of an existing API key or to create a new one."
}

provider "ibm" {
  softlayer_username = "${var.softlayer_username}"
  softlayer_api_key = "${var.softlayer_api_key}"
}
