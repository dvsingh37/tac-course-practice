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

resource "aws_instance" "dv_splat" {
  ami           = "ami-05fa46471b02db0ce"
  instance_type = "t2.micro"

  ebs_block_device {
    device_name = "sda1"
    volume_size = "1"
  }

  ebs_block_device {
    device_name = "sda2"
    volume_size = "1"
  }


}