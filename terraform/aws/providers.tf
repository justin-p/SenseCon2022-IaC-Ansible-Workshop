terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 1.2.1"
}

provider "aws" {
  profile = "default"
  region  = "eu-central-1"
  default_tags {
    tags = {
      Name = local.tag
      SenseCon = "SenseCon"
    }
  }
}