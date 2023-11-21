# Versions 
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.40.0"
    }
  }
}

# Authentication to AWS from Terraform code
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

terraform {
  backend "s3" {
    bucket = "cloudproject55"
    key    = "bucketstatefile/terraform.tfstate"
    region = "us-east-1"
  }
}

# Continuous Integration - Jenkins
resource "aws_instance" "cloudbinary_jenkins"
 {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = ["subnet-08be25aaaa11c3766"]
  vpc_security_group_ids = ["sg-0529805ea8638408a"]
  iam_instance_profile   = var.iam_instance_profile
  user_data              = file ("jenkins.sh")
  tags = {
    Name      = "cloudbinary_Jenkins"
    CreatedBy = "Terraform"
  }
}
