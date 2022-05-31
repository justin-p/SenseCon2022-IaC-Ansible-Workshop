terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.19.0"
    }
    random = {
      source = "hashicorp/random"
    }
  }
  required_version = ">= 1.2.1"
}

variable "do_token" {}

provider "digitalocean" {
  token = var.do_token
}
