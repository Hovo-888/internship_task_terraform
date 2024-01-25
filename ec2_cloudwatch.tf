// Stexcuma AWS CloudWatch
resource "aws_cloudwatch_metric_alarm" "high_cpu_utilization" {
  alarm_name          = var.ec2_cloudwatch_vars.alarm_name
  comparison_operator = var.ec2_cloudwatch_vars.comparison_operator_name
  evaluation_periods  = var.ec2_cloudwatch_vars.evaluation_periods_name
  metric_name         = var.ec2_cloudwatch_vars.metric_name
  namespace           = var.ec2_cloudwatch_vars.namespace_name
  period              = var.ec2_cloudwatch_vars.period
  statistic           = var.ec2_cloudwatch_vars.statistics
  threshold           = var.ec2_cloudwatch_vars.threshold
  alarm_description   = var.ec2_cloudwatch_vars.alarm_description
  actions_enabled     = true

  dimensions = {
    InstanceId = aws_instance.task_server.id
  }

  alarm_actions = [
    "arn:aws:sns:us-east-1:${data.aws_caller_identity.current.account_id}:my-sns-topic"
  ]

  tags = {
    Name = var.ec2_cloudwatch_vars.alarm_tag
  }
}


resource "aws_cloudwatch_log_group" "ec2_log_group" {
  name = "/aws/ec2/web_server"

  retention_in_days = 90

  tags = {
    Name = "EC2 Log Group"
  }
}
