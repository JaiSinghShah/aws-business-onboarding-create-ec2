provider "aws" {
  region = "ap-south-1"  # Set region to ap-south-1
}

# Create the EC2 instance without an explicit Security Group (defaults to default security group)
resource "aws_instance" "my_ec2" {
  ami           = "ami-06b6e5225d1db5f46"  # Your specified AMI ID
  instance_type = "t2.micro"  # Adjust the instance type as necessary

  # No explicit security group defined, using the default security group
  # If needed, add custom security groups here

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
