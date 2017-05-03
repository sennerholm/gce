# gce
GCE stuff, fabric conf etc

## Requirements

### Google Account
First, register a new account at google with your own email
https://accounts.google.com/SignUpWithoutGmail

### GCE account
Follow [these instructions](https://github.com/kelseyhightower/craft-kubernetes-workshop/blob/master/labs/create-gce-account.md)
to create a new GCE account, this will require your credit card information
although you will not be billed anything.

Create a new project from thee Google cloud console and enable the [Container Engine](https://console.cloud.google.com/apis/api/container.googleapis.com/overview)
and the [Compute Engine](https://console.cloud.google.com/apis/api/compute-component.googleapis.com/overview) API.

## Terraform

Make sure you have [terraform installed.](https://www.terraform.io/intro/getting-started/install.html)

Follow: https://www.terraform.io/docs/providers/google/index.html "Authentication JSON File"
Create a new terraform service account, Editor on your project.
To get Json file, save it to `terraform/secrets-google.json`

Copy `terraform/template/samplesecrets.tf` to `terraform/secrets.tf` and update it with your values.

Go to `terraform/` and run:

`terraform plan`

`terraform apply`

You then have a gce cluster up and running over 3 failure zones.

# To reach the new gcloud environment from command line

From the `terraform/` run:

```
export GOOGLE_APPLICATION_CREDENTIALS=$PWD/secrets-google.json
gcloud config set compute/zone europe-west1-b
gcloud container clusters get-credentials production
```
After that it should be possible to run gcloud and kubectl to connect to the new cluster