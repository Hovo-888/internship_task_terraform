resource "aws_eip" "task_nat" {
  tags = {
    Name = var.nat_vars.nat_name
  }
}


resource "aws_nat_gateway" "task_nat" {
  allocation_id = aws_eip.task_nat.id
  subnet_id     = aws_subnet.task_public_subnet_1.id

  tags = {
    Name = var.nat_vars.gateway_name
  }
}


resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.task-vpc.id

  route {
    cidr_block     = var.nat_vars.private_route_table_cidr_block
    nat_gateway_id = aws_nat_gateway.task_nat.id
  }

  tags = {
    Name = var.nat_vars.private_route_table_name
  }
}


resource "aws_route_table_association" "task_private_route_table_assoc" {
  subnet_id      = aws_subnet.task_private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}
