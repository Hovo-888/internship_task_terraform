variable "ami" {
  type = map(any)
  default = {
    "task-server-ami" = "ami-0a3c3a20c09d6f377"
  }
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "server_name" {
  type    = string
  default = "task-server"
}

variable "server_key_var" {
  type = map(any)
  default = {
    "server_key_name" = "server-key"
    "server_Key_path" = "./keys/server-key.pub"
  }
}


variable "nat_vars" {
  type = map(any)
  default = {
    nat_name                       = "task_nat_eip"
    gateway_name                   = "task_nat_gateway"
    private_route_table_cidr_block = "0.0.0.0/0"
    private_route_table_name       = "task_private_route_table"
  }
}


variable "elb_vars" {
  type = map(any)
  default = {
    elb_name          = "task-load-balancer"
    elb_type          = "application"
    target_group_name = "task-target-group"
  }
}


variable "dynamo_db_vars" {
  type = map(any)
  default = {
    table_name        = "task-dynamodb-table"
    hash_key_name     = "partition_key"
    sort_key_name     = "sort_key"
    gsi_name          = "task-gsi"
    gsi_hash_key_name = "gsi_partition_key"
    gsi_range_key     = "gsi_sort_key"
  }
}

variable "ec2_cloudwatch_vars" {
  type = map(any)
  default = {
    alarm_name               = "high-cpu-utilization"
    comparison_operator_name = "GreaterThanOrEqualToThreshold"
    evaluation_periods_name  = "2"
    metric_name              = "CPUUtilization"
    namespace_name           = "AWS/EC2"
    period                   = "300"
    statistics               = "Average"
    threshold                = "80"
    alarm_description        = "This metric monitors ec2 cpu utilization"
    alarm_tag                = "EC2 High CPU Utilization Alarm"
  }
}

variable "dynamodb_read_cloudwatch_vars" {
  type = map(any)
  default = {
    read_alarm_name          = "high-read-capacity"
    read_comparison_operator = "GreaterThanOrEqualToThreshold"
    read_evaluation_periods  = "2"
    read_metric_name         = "ConsumedReadCapacityUnits"
    read_namespace           = "AWS/DynamoDB"
    read_period              = "300"
    read_statistics          = "Sum"
    read_threshold           = "100"
    read_alarm_description   = "This metric monitors dynamodb read capacity"
    read_alarm_tag           = "High Read Capacity Alarm"
  }
}

variable "dynamodb_write_cloudwatch_vars" {
  type = map(any)
  default = {
    write_alarm_name          = "high-write-capacity"
    write_comparison_operator = "GreaterThanOrEqualToThreshold"
    write_evaluation_periods  = "2"
    write_metric_name         = "ConsumedWriteCapacityUnits"
    write_namespace           = "AWS/DynamoDB"
    write_period              = "300"
    write_statistics          = "Sum"
    write_threshold           = "100"
    write_alarm_description   = "This metric monitors dynamodb write capacity"
    write_alarm_tag           = "High Write Capacity Alarm"
  }
}


variable "s3_bucket_vars" {
  type = map(any)
  default = {
    bucket_name        = "task-s3-bucket-for-logs"
    access_policy_name = "s3_access_policy"
    access_policy_desc = "IAM policy for S3 bucket access"
  }
}

variable "iam_user_vars" {
  type = map(any)
  default = {
    ec2_cloudwatch_role_name   = "ec2_cloudwatch_logs_role"
    ec2_cloudwatch_policy_name = "ec2_cloudwatch_logs_policy",
    ec2_cloudwatch_policy_desc = "A policy that allows EC2 instances to write logs to CloudWatch",
    log_profile_name           = "ec2_cloudwatch_logs_profile"
  }
}

variable "ecr_vars" {
  type = map(any)
  default = {
    repo_name        = "task_repo",
    image_mutability = "MUTABLE"
  }
}


variable "eks_vars" {
  type = map(any)
  default = {
    name = "task_eks_cluster"
    node_group_name = "task-node-group"
  }
}
