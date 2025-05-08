provider "aws" {
  region = "eu-west-2"
}

resource "aws_security_group" "web_sg" {
  name = "web_sg"
  description = "Allow HTTP Traffic"

  ingress {
  from_port = 80 
  to_port = 80
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web" {
  ami = "ami-0dfe0f1abee59c78d"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web_sg.id]
}
