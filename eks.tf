// Stexcuma AWS Kubernetes cluster
resource "aws_eks_cluster" "eks_cluster" {
  name     = var.eks_vars.name
  role_arn = aws_iam_role.cluster_role.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.task_public_subnet_1.id,
      aws_subnet.task_public_subnet_2.id
    ]
  }
}

// Stexcuma Kubernetes noderi group
resource "aws_eks_node_group" "node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = var.eks_vars.node_group_name
  node_role_arn   = aws_iam_role.node_role.arn
  subnet_ids      = [
    aws_subnet.task_public_subnet_1.id,
    aws_subnet.task_public_subnet_2.id,
  ]

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  instance_types = ["t3.medium"]
}

// Kubernetsi clusteri stexcumic heto apply a linum manifestnery(deployment, service, hpa)
resource "null_resource" "eks_manifests_deployment" {

  triggers = {
    build_script = file("./scripts/manifests_apply.sh")
  }

  provisioner "local-exec" {
    command = "chmod +x ./scripts/manifests_apply.sh"
  }

  provisioner "local-exec" {
    command = "./scripts/manifests_apply.sh"
  }


  depends_on = [aws_eks_cluster.eks_cluster]
}
