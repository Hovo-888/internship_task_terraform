// Stexcuma AWS i EC2 server
resource "aws_instance" "task_server" {
  ami                    = var.ami.task-server-ami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.server-key.key_name
  vpc_security_group_ids = [aws_security_group.server-sg.id]
  subnet_id              = aws_subnet.task_public_subnet_1.id
  iam_instance_profile   = aws_iam_instance_profile.ec2_cloudwatch_logs_profile.name

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y awslogs
              systemctl start awslogsd
              systemctl enable awslogsd.service
              EOF

  tags = {
    Name = var.server_name
  }
}
