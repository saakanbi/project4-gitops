output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.eks.cluster_endpoint
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = module.eks.cluster_name
}

output "region" {
  description = "AWS region"
  value       = var.region
}

output "argocd_server" {
  description = "ArgoCD server endpoint"
  value       = module.argocd.argocd_server
}

output "prometheus_server" {
  description = "Prometheus server endpoint"
  value       = module.argocd.prometheus_server
}