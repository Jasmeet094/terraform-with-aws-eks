# terraform providers

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.66"
    }

  }
  backend "s3" {
    bucket         = "jasmeet-test-terraform"
    key            = "dev/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "jasmeet-terraform-test"
  }
}

provider "aws" {
  region = var.region
}


