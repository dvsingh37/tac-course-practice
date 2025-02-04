provider "aws" {

  region = var.d_region

}

resource "aws_vpc" "t_vpc" {
  cidr_block = var.d_user_cidr
  tags = {
    Name = var.d_user_vpc
  }

}

module "aws_webserver" {
  source             = "../modules/webserver"
  user_cidr          = var.d_cidr
  user_subnet_name   = var.d_subnet_name
  user_ami           = var.d_ami
  user_instance_type = var.d_instance_type
  user_instance_name = var.d_instance_name
  user_vpc           = aws_vpc.t_vpc.id

}