provider "aws" {
  region = "ap-south-1"  # Set region to ap-south-1
}

# Create the Security Group
resource "aws_security_group" "my_ec2_sg" {
  name        = "My_EC2-SG"
  description = "Allow HTTP and SSH access"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create the EC2 instance
resource "aws_instance" "my_ec2" {
  ami           = "ami-06b6e5225d1db5f46"  # Your specified AMI ID
  instance_type = "t2.micro"  # Adjust the instance type as necessary

  security_groups = [aws_security_group.my_ec2_sg.name]

  tags = {
    Name = "MyEC2Instance"
  }

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl enable httpd
              systemctl start httpd
              EOF
}
