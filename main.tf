provider "aws" {
  region = "us-west-2"  # Change to your desired region
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"  # Replace with a valid AMI ID for your region
  instance_type = "t2.micro"  # Choose your instance type

  tags = {
    Name = "Hello AWS"
  }
}
