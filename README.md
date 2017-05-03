# gce
GCE stuff, fabric conf etc

Requirement: Google account
First, register a new account at google with cour own email
https://accounts.google.com/SignUpWithoutGmail

Follow 
https://github.com/kelseyhightower/craft-kubernetes-workshop/blob/master/labs/create-gce-account.md
To create GCE account (and new user bonus) (Needs visa)
Creating a project and enable API

Follow: https://www.terraform.io/docs/providers/google/index.html "Authentication JSON File"
Create a new terraform service account, Editor on your project.
To get Json file, save it to terraform->secrets-google.json

Copy secrets.tf from terraform/template/samplesecrets.tf and update it with your values.

Go to terraform and run:

terraform plan 
terraform apply

You then have a gce kluster upp and running over 3 failure zones

# To reach it from command line
gcloud auth application-default login

