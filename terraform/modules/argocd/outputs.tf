output "argocd_server" {
  description = "ArgoCD server endpoint"
  value       = helm_release.argocd.name
}

output "prometheus_server" {
  description = "Prometheus server endpoint"
  value       = helm_release.prometheus.name
}