#!/bin/sh
cd infra/gcp/apps
gcloud container clusters get-credentials gke-cloudymation-cluster --zone europe-west2-a --project cloudymation
terraform init
terraform apply --auto-approve
