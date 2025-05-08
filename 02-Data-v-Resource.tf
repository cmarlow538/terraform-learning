provider "aws" {
  region = "eu-west-2"
}

data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners = ["amazon"]

  filter {
  name = "name"
  values = ["amzn2-ami-hvm-*"]
  }
}

resource "aws_instance" "my_test_instance" {
  ami = data.aws_ami.latest_amazon_linux.id
  instance_type = "t2.micro"
}
