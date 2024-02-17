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

### Deploy an Amazon Linux 2023 AMI
resource "aws_instance" "example"{
  ami = "ami-0e731c8a588258d0d"
  instance_type = "t2.micro"
 
  tags = {
    Name = "example-tf"
  }
}

