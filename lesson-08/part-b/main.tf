terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.46"
    }
  }
}

provider "aws" {
  region = "ap-south-1"

}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.18.1"

  name            = var.d_vpc_name
  cidr            = var.d_vpc_cidr
  azs             = var.d_azs
  private_subnets = var.d_private_subnets_cidr
  public_subnets  = var.d_public_subnets_cidr
}

module "ec2-instance" {
  source        = "terraform-aws-modules/ec2-instance/aws"
  version       = "5.7.1"
  ami           = var.d_ami
  instance_type = var.d_instance_type
  subnet_id     = module.vpc.public_subnets[0]
}