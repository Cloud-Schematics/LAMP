variable "softlayer_username" {
  description = "Enter the user name to access IBM Cloud classic infrastructure. Go to the [IBM Cloud API keys](https://cloud.ibm.com/iam/apikeys) page, and hover on the row of your API key, and select the **Actions** icon. Then, click **Details** and copy your user name. "
}
variable "softlayer_api_key" {
  description = "Enter your classic infrastructure API key. Go to the [IBM Cloud API keys page](https://cloud.ibm.com/iam/apikeys) to get the details of an existing API key or to create a new one."
}

provider "ibm" {
  softlayer_username = "${var.softlayer_username}"
  softlayer_api_key = "${var.softlayer_api_key}"
}
