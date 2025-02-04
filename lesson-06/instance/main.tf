resource "aws_instance" "lesson6" {
  ami                    = "ami-05fa46471b02db0ce"
  instance_type          = "t2.micro"
  key_name               = "d_key"
  vpc_security_group_ids = [aws_security_group.http.id, aws_security_group.https.id, aws_security_group.ssh.id]

  user_data = file("../script/shell-script.sh")

  tags = {
    name = "lesson6"
  }

}


resource "aws_key_pair" "dv_key" {
  key_name   = "d_key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC0JVOrysDdwLOBTZLKWNJDpKd+jX77OJtFRIbWj+Y4W durvsing@durvsing-mac"
}

resource "aws_security_group" "ssh" {
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
  }
}

resource "aws_security_group" "https" {
  ingress {
    cidr_blocks = ["192.168.0.0/16"]
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
  }
}

resource "aws_security_group" "http" {
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
  }
}