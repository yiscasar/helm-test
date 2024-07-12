provider "aws" {
  region = "eu-west-1"
}

terraform {
  backend "s3" {
    bucket         = "yiscas-tf-state"
    dynamodb_table = "terraform-state"
    key            = "terraform-state-lock"
    region         = "eu-west-1"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.47"
    }
  }
  required_version = "~>1.5.0"
}
