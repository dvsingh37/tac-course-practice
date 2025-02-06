terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

provider "aws" {
  region = var.user_region

}

resource "aws_instance" "my_instance" {

  ami           = "ami-05fa46471b02db0ce"
  instance_type = var.my_instance_type

}

variable "user_region" {
  description = "please tell the region"
}

variable "my_instance_type" {
  description = "please tell me instance type"

}

