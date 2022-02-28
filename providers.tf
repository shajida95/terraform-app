terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 3.0"
        }
    }
}
 
# Configure the AWS Provider
provider "aws" {
    profile = "default"
    region = "us-east-1"
}
