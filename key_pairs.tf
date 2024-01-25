resource "aws_key_pair" "server-key" {
  key_name   = var.server_key_var.server_key_name
  public_key = file(var.server_key_var.server_Key_path)
}
