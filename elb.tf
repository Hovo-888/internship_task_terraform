resource "aws_lb" "task_alb" {
  name               = var.elb_vars.elb_name
  internal           = false
  load_balancer_type = var.elb_vars.elb_type
  security_groups    = [aws_security_group.server-sg.id]
  subnets            = [aws_subnet.task_public_subnet_1.id, aws_subnet.task_public_subnet_2.id]

  enable_deletion_protection = false

  tags = {
    Name = var.elb_vars.elb_name
  }
}


resource "aws_lb_target_group" "task_target_group" {
  name     = var.elb_vars.target_group_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.task-vpc.id

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    path                = "/"
    protocol            = "HTTP"
    interval            = 30
    matcher             = "200-299"
  }

  tags = {
    Name = var.elb_vars.target_group_name
  }
}


resource "aws_lb_listener" "task_listener" {
  load_balancer_arn = aws_lb.task_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.task_target_group.arn
  }
}


resource "aws_lb_target_group_attachment" "web_target_attach" {
  target_group_arn = aws_lb_target_group.task_target_group.arn
  target_id        = aws_instance.task_server.id
  port             = 80
}
