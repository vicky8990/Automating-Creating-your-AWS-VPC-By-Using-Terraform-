terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
    #configuration option
    region = "ap-south-1"
     profile = "default"
}
