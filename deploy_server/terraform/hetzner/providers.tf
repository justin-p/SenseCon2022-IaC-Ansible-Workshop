terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.23.0"
    }
    random = {
      source = "hashicorp/random"
    }
  }
  required_version = ">= 1.2.1"
}

variable "hetzner_token" {}

provider "hcloud" {
  token = var.hetzner_token
}