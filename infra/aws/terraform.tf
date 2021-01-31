provider "aws" {
}

provider "tfe" {
  token = "guz6wzA4aeAgkg.atlasv1.3E6e7mwJYC9LZklYvPMc9tzUL5kaq3zQ97UnNZhce4zaza1vg0vrKFkyQEGdNSfIRCs"
}

terraform {
  backend "remote" {
    organization = "corebox"
    hostname     = "app.terraform.io"
    token        = "guz6wzA4aeAgkg.atlasv1.3E6e7mwJYC9LZklYvPMc9tzUL5kaq3zQ97UnNZhce4zaza1vg0vrKFkyQEGdNSfIRCs"

    workspaces {
      prefix = "dev-awsproject-aws-infra-"
    }
  }
}