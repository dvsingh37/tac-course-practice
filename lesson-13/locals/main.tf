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

resource "aws_iam_user" "multiuser" {

  for_each = local.accounts
  name     = each.key
  tags     = local.common_tags

}

locals {
  accounts = toset(
    ["man",
      "jan",
      "dhan"]
      )

  common_tags = {
    "created_by"  = "dvsingh"
    "create_time" = timestamp()
  }
}

