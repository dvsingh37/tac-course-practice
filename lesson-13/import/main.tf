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

resource "aws_instance" "import" {
  ami           = "ami-0c50b6f7dc3701ddd"
  instance_type = "t2.micro"

}