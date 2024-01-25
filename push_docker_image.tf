// Elastic Container Registry sarqeluc heto mer web appy conteinrize enq anum sarqumenq image ev pushum ECR
resource "null_resource" "push_docker_image" {

  triggers = {
    build_script = file("./app/create_docker_image.sh")
  }

  provisioner "local-exec" {
    command = "chmod +x ./app/create_docker_image.sh"
  }

  provisioner "local-exec" {
    command = "./app/create_docker_image.sh ${aws_ecrpublic_repository.task_app_repo.repository_name} ${data.aws_caller_identity.current.account_id}"
  }

  depends_on = [aws_ecrpublic_repository.task_app_repo]
}