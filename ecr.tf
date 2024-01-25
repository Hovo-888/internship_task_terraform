resource "aws_ecrpublic_repository" "task_app_repo" {
  repository_name      = var.ecr_vars.repo_name
  force_destroy = true
}
