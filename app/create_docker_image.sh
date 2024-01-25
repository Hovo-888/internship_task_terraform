#!/bin/bash

#Mtnel app folderi mej
cd "$(dirname "$0")"

IMAGE_NAME="task_app_image"
TAG="latest"
AWS_REGION="us-east-1"

# Talisenq repon argumentov
ECR_REPO_NAME="$1"

# Talisenq AWS i account id-n argumentov
AWS_ACCOUNT_ID="$2"


# Qayl 1: Sarqumenq Docker image
docker build -t ${IMAGE_NAME}:${TAG} .

# Qayl 2: Loginenq linum ECR
aws ecr-public get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin public.ecr.aws

# Qayl 3: Tagenq anum image y pusheluc araj
docker tag ${IMAGE_NAME}:${TAG} public.ecr.aws/${AWS_ACCOUNT_ID}/${ECR_REPO_NAME}:${TAG}

# Qayl 4: Pushumenq image y ECR
docker push public.ecr.aws/${AWS_ACCOUNT_ID}/${ECR_REPO_NAME}:${TAG}
