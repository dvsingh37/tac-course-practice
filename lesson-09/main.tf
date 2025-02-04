terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.16"
    }
  }
}

provider "aws" {
  region = "ap-south-1"

}

resource "aws_iam_user" "multi_user" {
  count = length(var.names)
  name  = element(var.names, count.index)

}