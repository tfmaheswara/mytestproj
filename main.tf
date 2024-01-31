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
    access_key = "AKIAU6GDWEBIARJUZE3E"
    secret_key = "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" 
}
*/
/*
data "aws_ami" "app_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["bitnami-tomcat-*-x86_64-hvm-ebs-nami"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
*/
resource "aws_instance" "web" {
  ami           = "ami-0a3c3a20c09d6f377"
  instance_type = "t2.micro"
  subnet_id     = "subnet-0bf1645717a8b2f54"
  security_groups = ["sg-05e44518445dee415"]
  tags = {
    Name = "HelloWorld"
  }
}