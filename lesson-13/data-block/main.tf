terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

provider "aws" {

  region = "ap-south-1"

}

data "aws_ami" "rhel" {
  most_recent = true
  owners      = ["309956199498"] #amazon

}

resource "aws_instance" "instance" {
  ami           = data.aws_ami.rhel.id
  instance_type = "t2.micro"
  tags = {
    Name = "dinstance"
  }

}