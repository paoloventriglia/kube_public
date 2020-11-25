#!/bin/sh
cd infra/gcp
terraform init
terraform validate
terraform plan -out=plan