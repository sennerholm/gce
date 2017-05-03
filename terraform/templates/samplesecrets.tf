variable "gce_prod_username" {
  description = "The username to use for HTTP basic authentication when accessing the Kubernetes master endpoint"
  default     = "adminuser"
}

variable "gce_prod_password" {
  description = "The password to use for HTTP basic authentication when accessing the Kubernetes master endpoint"
  default     = "Change1Password"
}


// From: 
// Configure the Google Cloud provider
provider "google" {
  credentials = "${file("secrets-google.json")}"
  project     = "myprojectname-same-as-jsonfile"
  region      = "${var.gce_zone}"
}

