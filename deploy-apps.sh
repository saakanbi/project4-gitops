#!/bin/bash

# Get EKS cluster info
CLUSTER_NAME=$(terraform -chdir=terraform output -raw cluster_name)
REGION=$(terraform -chdir=terraform output -raw region)

# Configure kubectl
aws eks update-kubeconfig --region $REGION --name $CLUSTER_NAME

# Create namespaces
kubectl create namespace apps --dry-run=client -o yaml | kubectl apply -f -
kubectl create namespace monitoring --dry-run=client -o yaml | kubectl apply -f -

# Apply application manifests
kubectl apply -f kubernetes/manifests/frontend.yaml
kubectl apply -f kubernetes/manifests/backend.yaml
kubectl apply -f kubernetes/manifests/monitoring.yaml

# Get service URLs
echo "ArgoCD URL:"
kubectl get svc argocd-server -n argocd
echo "ArgoCD initial password:"
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
echo
echo "Frontend URL:"
kubectl get ingress -n apps frontend-ingress
echo "Backend URL:"
kubectl get ingress -n apps backend-ingress
echo "Grafana URL:"
kubectl get svc prometheus-grafana -n monitoring