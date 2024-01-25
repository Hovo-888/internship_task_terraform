#!/bin/bash


cd "$(dirname "$0")"

IMAGE_NAME="task_app_image"
TAG="latest"
AWS_REGION="us-east-1"


ECR_REPO_NAME="$1"


AWS_ACCOUNT_ID="$2"



docker build -t ${IMAGE_NAME}:${TAG} .


aws ecr-public get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin public.ecr.aws


docker tag ${IMAGE_NAME}:${TAG} public.ecr.aws/${AWS_ACCOUNT_ID}/${ECR_REPO_NAME}:${TAG}


docker push public.ecr.aws/${AWS_ACCOUNT_ID}/${ECR_REPO_NAME}:${TAG}
