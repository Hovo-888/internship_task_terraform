#!/bin/bash

AWS_REGION="us-east-1"
CLUSTER_NAME="task_eks_cluster"

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DEPLOYMENT_FILE="$SCRIPT_DIR/eks_manifests/deployment.yaml"
SERVICE_FILE="$SCRIPT_DIR/eks_manifests/service.yaml"
HPA_FILE="$SCRIPT_DIR/eks_manifests/hpa.yaml"

aws eks --region $AWS_REGION update-kubeconfig --name $CLUSTER_NAME

kubectl apply -f $DEPLOYMENT_FILE
kubectl apply -f $SERVICE_FILE
kubectl apply -f $HPA_FILE
