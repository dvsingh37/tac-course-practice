terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = ">= 1.48"
    }
  }
}

resource "aws_subnet" "T_subnet" {
    vpc_id = var.user_vpc
    cidr_block = var.user_cidr
    tags = {
      Name = var.user_subnet_name
    }
  
}

resource "aws_instance" "parta" {
    ami = var.user_ami
    instance_type = var.user_instance_type
    subnet_id =   aws_subnet.T_subnet.id
    tags = {
      Name = var.user_instance_name
    }
}

