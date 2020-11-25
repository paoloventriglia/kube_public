provider "google" {
  region = var.region
}

provider "google-beta" {
  region = var.region
}

provider "kubernetes" {}

provider "cloudflare" {
  api_token = "*****"
}

terraform {
  backend "remote" {
    organization = "corebox"
    hostname     = "app.terraform.io"
    token        = "*****"

    workspaces {
      name = "cloudymation-infra"
    }
  }
  required_version = ">= 0.12"
}


