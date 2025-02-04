terraform {
  required_providers {
    aws = {
      version = ">= 4.80"
      source  = "hashicorp/aws"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-south-1"

}

resource "aws_instance" "dsingh" {
  ami           = var.ami
  instance_type = "t2.micro"
  tags = {
    Name = var.instance_name
  }
}
