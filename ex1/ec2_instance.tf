provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "intro" {
  ami                    = ""
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  key_name               = "intern-test"
  vpc_security_group_ids = [""]
  tags = {
    Name    = "Aksh Terraform Test"
    Creator = "Aksh through Terraform"
  }
}