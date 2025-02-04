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

resource "aws_iam_user" "function" {
  name = "function"

  tags = {
    description = "OPS"
    createtime  = timestamp()
    date_format = formatdate("DD MMM YYYY  hh:mm  ZZZ ", timestamp())
  }
}