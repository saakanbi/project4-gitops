# This file is used to configure ArgoCD applications
# The actual ArgoCD installation is in the argocd module

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
        repoURL        = "https://github.com/yourusername/project4-gitops-apps.git"
        targetRevision = "HEAD"
        path           = "helm/frontend"
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
        repoURL        = "https://github.com/yourusername/project4-gitops-apps.git"
        targetRevision = "HEAD"
        path           = "helm/backend"
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
}