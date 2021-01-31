terraform {
  backend "remote" {
    organization = "your org"
    hostname     = "app.terraform.io"
    token        = "your token"

    workspaces {
      name = "your workspace"
    }
  }
  required_version = ">= 0.13"

  required_providers {
    google = {
      source = "hashicorp/google"
    }
    google-beta = {
      source = "hashicorp/google-beta"
    }
    template = {
      source = "hashicorp/template"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
}

provider "cloudflare" {
  api_token = "your token"
}
