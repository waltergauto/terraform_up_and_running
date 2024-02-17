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

# Deploy a security group to allow port 8080
resource "aws_security_group" "instance" {
  name = "terraform-example-instance"

  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

### Deploy an Amazon Linux 2023 AMI
resource "aws_instance" "example"{
  ami = "ami-0e731c8a588258d0d"
  instance_type = "t2.micro"
  # Pass security group instance created before to ec2 instance
  vpc_security_group_ids = [aws_security_group.instance.id]
 
  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World!" > index.xhtml
              nohup busybox httpd -f -p 8080 &
              EOF
  user_data_replace_on_change = true

  tags = {
    Name = "example-tf"
  }

}

