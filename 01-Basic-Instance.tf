### Task to create a basic AWS EC2 instance

provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "my_test_instance"{
  ami = "ami-0dfe0f1abee59c78d"
  instance_type = "t2.micro"
}
