resource "kubernetes_manifest" "frontend_application" {
  manifest = {
    apiVersion = "argoproj.io/v1alpha1"
    kind       = "Application"
    metadata = {
      name      = "frontend"
      namespace = "argocd"
    }
    spec = {
      project = "default"
      source = {
        repoURL        = "https://github.com/wole9548/project4-gitops.git"
        targetRevision = "dev"
        path           = "kubernetes/manifests"
        directory = {
          include = "frontend.yaml"
        }
      }
      destination = {
        server    = "https://kubernetes.default.svc"
        namespace = "apps"
      }
      syncPolicy = {
        automated = {
          prune    = true
          selfHeal = true
        }
      }
    }
  }

  depends_on = [
    kubernetes_namespace.argocd,
    helm_release.argocd,
    kubernetes_namespace.apps
  ]
}

resource "kubernetes_manifest" "backend_application" {
  manifest = {
    apiVersion = "argoproj.io/v1alpha1"
    kind       = "Application"
    metadata = {
      name      = "backend"
      namespace = "argocd"
    }
    spec = {
      project = "default"
      source = {
        repoURL        = "https://github.com/wole9548/project4-gitops.git"
        targetRevision = "dev"
        path           = "kubernetes/manifests"
        directory = {
          include = "backend.yaml"
        }
      }
      destination = {
        server    = "https://kubernetes.default.svc"
        namespace = "apps"
      }
      syncPolicy = {
        automated = {
          prune    = true
          selfHeal = true
        }
      }
    }
  }

  depends_on = [
    kubernetes_namespace.argocd,
    helm_release.argocd,
    kubernetes_namespace.apps
  ]
}

resource "kubernetes_manifest" "monitoring_application" {
  manifest = {
    apiVersion = "argoproj.io/v1alpha1"
    kind       = "Application"
    metadata = {
      name      = "monitoring"
      namespace = "argocd"
    }
    spec = {
      project = "default"
      source = {
        repoURL        = "https://github.com/wole9548/project4-gitops.git"
        targetRevision = "dev"
        path           = "kubernetes/manifests"
        directory = {
          include = "monitoring.yaml"
        }
      }
      destination = {
        server    = "https://kubernetes.default.svc"
        namespace = "monitoring"
      }
      syncPolicy = {
        automated = {
          prune    = true
          selfHeal = true
        }
      }
    }
  }

  depends_on = [
    kubernetes_namespace.argocd,
    helm_release.argocd,
    kubernetes_namespace.monitoring
  ]
}