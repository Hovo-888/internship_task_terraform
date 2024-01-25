//Stexcuma AWS CloudWatch DynamoDB i hamar DB i mej grelu mec arjeq unenalu depqum log anelu hamar
resource "aws_cloudwatch_metric_alarm" "high_read_capacity" {
  alarm_name          = var.dynamodb_read_cloudwatch_vars.read_alarm_name
  comparison_operator = var.dynamodb_read_cloudwatch_vars.read_comparison_operator
  evaluation_periods  = var.dynamodb_read_cloudwatch_vars.read_evaluation_periods
  metric_name         = var.dynamodb_read_cloudwatch_vars.read_metric_name
  namespace           = var.dynamodb_read_cloudwatch_vars.read_namespace
  period              = var.dynamodb_read_cloudwatch_vars.read_period
  statistic           = var.dynamodb_read_cloudwatch_vars.read_statistics
  threshold           = var.dynamodb_read_cloudwatch_vars.read_threshold
  alarm_description   = var.dynamodb_read_cloudwatch_vars.read_alarm_description
  actions_enabled     = true

  dimensions = {
    TableName = aws_dynamodb_table.task_dynamodb_table.name
  }

  alarm_actions = ["arn:aws:sns:us-east-1:${data.aws_caller_identity.current.account_id}:my-sns-topic"]

  tags = {
    Name = var.dynamodb_read_cloudwatch_vars.read_alarm_tag
  }
}

//Stexcuma AWS CloudWatch DynamoDB i hamar DB ic kardalu mec arjeq unenalu depqum log anelu hamar
resource "aws_cloudwatch_metric_alarm" "high_write_capacity" {
  alarm_name          = var.dynamodb_write_cloudwatch_vars.write_alarm_name
  comparison_operator = var.dynamodb_write_cloudwatch_vars.write_comparison_operator
  evaluation_periods  = var.dynamodb_write_cloudwatch_vars.write_evaluation_periods
  metric_name         = var.dynamodb_write_cloudwatch_vars.write_metric_name
  namespace           = var.dynamodb_write_cloudwatch_vars.write_namespace
  period              = var.dynamodb_write_cloudwatch_vars.write_period
  statistic           = var.dynamodb_write_cloudwatch_vars.write_statistics
  threshold           = var.dynamodb_write_cloudwatch_vars.write_threshold
  alarm_description   = var.dynamodb_write_cloudwatch_vars.write_alarm_description
  actions_enabled     = true

  dimensions = {
    TableName = aws_dynamodb_table.task_dynamodb_table.name
  }

  alarm_actions = ["arn:aws:sns:us-east-1:${data.aws_caller_identity.current.account_id}:my-sns-topic"]

  tags = {
    Name = var.dynamodb_write_cloudwatch_vars.write_alarm_tag
  }
}
