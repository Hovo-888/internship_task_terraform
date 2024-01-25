resource "aws_dynamodb_table" "task_dynamodb_table" {
  name           = var.dynamo_db_vars.table_name
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = var.dynamo_db_vars.hash_key_name
  range_key      = var.dynamo_db_vars.sort_key_name

  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = var.dynamo_db_vars.hash_key_name
    type = "S"
  }

  attribute {
    name = var.dynamo_db_vars.sort_key_name
    type = "S"
  }

  global_secondary_index {
    name            = var.dynamo_db_vars.gsi_name
    hash_key        = var.dynamo_db_vars.gsi_hash_key_name
    range_key       = var.dynamo_db_vars.gsi_range_key
    write_capacity  = 5
    read_capacity   = 5
    projection_type = "ALL"
  }

  attribute {
    name = var.dynamo_db_vars.gsi_hash_key_name
    type = "S"
  }

  attribute {
    name = var.dynamo_db_vars.gsi_range_key
    type = "S"
  }

  tags = {
    Name = var.dynamo_db_vars.table_name
  }
}


resource "null_resource" "dynamodb_fill_data" {

  triggers = {
    always_run = timestamp()
  }

  provisioner "local-exec" {
    command = "python ./dynamodb_data.py"
  }


  depends_on = [aws_dynamodb_table.task_dynamodb_table]
}
