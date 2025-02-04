terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-south-1"

}

resource "aws_instance" "tue" {
  ami           = "ami-05fa46471b02db0ce"
  instance_type = "t2.micro"

  tags = {
    Name = "d_instance"
  }

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_iam_user" "myuser" {
  for_each   = toset(["mon", "tue", "wed"])
  name       = each.key
  depends_on = [aws_instance.tue]

}

