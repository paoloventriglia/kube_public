#!/bin/sh

# Install packages
sudo apt-get install -y software-properties-common git kubectl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt update
sudo apt install -y terraform=0.14.0

# Clone Repo
git_token=`gcloud secrets versions  access 1 --secret=git_token`
git clone "your repo"

# Deploy App
export HOME=/root
cd "your app repo"/deployment/apps
gcloud container clusters get-credentials "your cluster" --zone europe-west2-a --project "your project"
terraform init
terraform apply --auto-approve

