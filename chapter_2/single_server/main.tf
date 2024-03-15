terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.37.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami = "ami-06aa3f7caf3a30282"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-example"
  }
}