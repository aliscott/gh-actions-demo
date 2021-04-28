
provider "aws" {
  region     = "${local.aws_region}"
  profile    = "${local.aws_profile}"
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.30"
    }
  }
}

resource "aws_instance" "web_app" {
  ami           = "ami-674cbc1e"
  instance_type = "t3.micro"
  root_block_device {
    volume_size = 10
  }
}
