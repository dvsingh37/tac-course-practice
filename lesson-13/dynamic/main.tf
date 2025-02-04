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

locals {
  inbound  = [[20,21,22], [80,443]]
  outbound = [[1000,1100], [1001,2001,3001]]
  name  = ["SG1", "SG2"]
}

resource "aws_security_group" "dynamic_sg" {
    count = 2
    name = local.name[count.index]
  dynamic "ingress" {
    for_each = local.inbound[count.index]
    content {
      from_port = ingress.value
      to_port   = ingress.value
      protocol  = "tcp"
      cidr_blocks = ["10.0.0.0/16"]
    }

  }

  dynamic "egress" {
    for_each = local.outbound[count.index]
    content {
      from_port = egress.value
      to_port   = egress.value
      protocol  = "tcp"
      cidr_blocks  = ["0.0.0.0/16"]
    }

  }

}