resource "aws_subnet" "task_public_subnet_1" {
  vpc_id                  = aws_vpc.task-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "task_public_subnet_1"
  }
}

resource "aws_subnet" "task_public_subnet_2" {
  vpc_id                  = aws_vpc.task-vpc.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"

  tags = {
    Name = "task_public_subnet_2"
  }
}

resource "aws_subnet" "task_private_subnet" {
  vpc_id     = aws_vpc.task-vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "task_private_subnet"
  }
}
