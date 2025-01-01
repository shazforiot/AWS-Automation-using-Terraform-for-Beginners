provider "aws" {
  region     = "us-east-1"
  access_key = "your aws access key"
  secret_key = "your aws secret key"
}

resource "aws_instance" "terraform_test" {
  ami                     = "ami-01816d07b1128cd2d"
  instance_type           = "t2.micro"
  key_name                = "terraformuser"
  security_groups         = ["terraform_sg"]

tags = {
    Name = "tf_server-1"
  }
}

resource "aws_security_group" "terraform_sg" {
  name        = "terraform_sg"
  description = "terraform_sg VPC security group"

  ingress {
    protocol  = "tcp"
    from_port = 22
    to_port   = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
