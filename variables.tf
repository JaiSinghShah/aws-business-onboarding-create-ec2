variable "aws_region" {
  description = "The AWS region where the resources will be deployed"
  type        = string
  default     = "us-east-1" # You can change it to the region of your choice
}

variable "instance_type" {
  description = "Type of EC2 instance to launch"
  type        = string
  default     = "t2.micro" # You can change it to a different instance type
}

