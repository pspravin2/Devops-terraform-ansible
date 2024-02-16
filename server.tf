terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.64.0"
    }
  }
}

provider "aws" {
region = "us-east-1"
}
resource "aws_instance" "myawsserver" {
  ami = "ami-0cf10cdf9fcd62d37"
  instance_type = "t2.micro"
  key_name = "gagan-import"

  tags = {
    Name = "gagan-DevOps-batch-server"
    env = "Production"
    owner = "Gagan Deep"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip} && echo ${self.public_ip} > /tmp/inv"
  }
}

