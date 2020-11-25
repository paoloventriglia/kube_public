provider "aws" {
}

provider "tfe" {
  token = "*****"
}

terraform {
  backend "remote" {
    organization = "corebox"
    hostname     = "app.terraform.io"
    token        = "*****"

    workspaces {
      prefix = "dev-awsproject-aws-infra-"
    }
  }
}