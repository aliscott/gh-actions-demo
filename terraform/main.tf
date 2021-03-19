provider "aws" {
  region                      = "us-east-1" # <<<<< Try changing this to eu-west-1 to compare the costs
}

resource "aws_instance" "web_app" {
  ami           = "ami-674cbc1e"
  instance_type = "t3.micro"              # <<<<< Try changing this to m5.8xlarge to compare the costs

  root_block_device {
    volume_size = 10
  }
}

resource "aws_lambda_function" "hello_world" {
  function_name = "hello_world"
  role          = "arn:aws:lambda:us-east-1:account-id:resource-id"
  handler       = "exports.test"
  runtime       = "nodejs12.x"
  memory_size   = 1024
}
