terraform {

  required_version = "~> 1.1.0"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  // Uncomment the following when you're ready to
  // store your state in S3
  /*
  backend "s3" {
    bucket  = "dsf-terraform-state"
    key     = "lambdas/<my-lambda-name>/prod/terraform.tfstate"
    region  = "us-east-1"
  }
  */
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Environment = var.tag-environment
      Name        = var.tag-project-name
      Owner       = var.tag-owner
    }
  }
}

## CORE VPC STATE
data "terraform_remote_state" "dsf" {
  backend = "s3"
  config = {
    bucket  = "dsf-terraform-state"
    key     = "core/prod/terraform.tfstate"
    region  = "us-east-1"
  }
}