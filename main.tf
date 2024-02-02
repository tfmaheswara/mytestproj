/*
terraform {
  required_version = ">= 0.12.0"

  required_providers {
    aws    = ">= 3.55"
    random = ">= 3.0"
  }
}
provider "aws" {
  # Configuration options
    region = "us-east-1"
    access_key = ""
    secret_key = ""
}
*/

data "aws_ami" "app_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["al2023-ami-2023.3.20240122.0-kernel-6.1-x86_64"]
  }

}

resource "aws_instance" "web" {
  ami           = data.aws_ami.app_ami.image_id
  #ami           = "ami-0a3c3a20c09d6f377"
  instance_type = "t3.micro"
  subnet_id     = "subnet-096b141240617b9b8"
  security_groups = ["sg-084371fe3d9b5e452"]
  tags = {
    Name = "HelloWorld"
  }
}