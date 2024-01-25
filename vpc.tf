resource "aws_vpc" "task-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "task-vpc"
  }
}



resource "aws_internet_gateway" "task-gw" {
  vpc_id = aws_vpc.task-vpc.id

  tags = {
    Name = "task-gateway"
  }
}
