# Project 4: GitOps React + Java App

This project implements a multi-tier application using GitOps with ArgoCD, including a React frontend, Java backend, and monitoring with Prometheus and Grafana.

## Architecture

- **Infrastructure**: AWS EKS cluster provisioned with Terraform
- **GitOps**: ArgoCD for continuous deployment
- **Applications**: React frontend and Java backend
- **Monitoring**: Prometheus and Grafana

## Project Structure

```
project4-gitops/
├── kubernetes/           # Kubernetes manifests
│   └── manifests/        # Application manifests
│       ├── frontend.yaml # React frontend
│       ├── backend.yaml  # Java backend
│       └── monitoring.yaml # Prometheus & Grafana
├── src/                  # Application source code
│   ├── frontend/         # React frontend code
│   │   ├── public/       # Static assets
│   │   ├── src/          # React components
│   │   ├── Dockerfile    # Frontend container build
│   │   └── package.json  # NPM dependencies
│   └── backend/          # Java backend code
│       ├── src/          # Java source files
│       ├── Dockerfile    # Backend container build
│       └── pom.xml       # Maven dependencies
└── terraform/            # Infrastructure as Code
    ├── modules/          # Terraform modules
    │   ├── argocd/       # ArgoCD installation
    │   ├── eks/          # EKS cluster
    │   └── vpc/          # VPC configuration
    ├── main.tf           # Main configuration
    ├── outputs.tf        # Outputs
    └── variables.tf      # Variables
```

## Prerequisites

- AWS CLI configured
- Terraform installed
- kubectl installed
- Docker installed

## Deployment Steps

### 1. Build and Push Docker Images

```bash
# Build and push frontend
cd src/frontend
docker build -t wole9548/frontend:latest .
docker push wole9548/frontend:latest

# Build and push backend
cd ../backend
docker build -t wole9548/backend:latest .
docker push wole9548/backend:latest
```

### 2. Provision Infrastructure

```bash
cd terraform
terraform init
terraform apply
```

### 3. Deploy Applications

```bash
# From project root
./deploy-apps.sh
```

### 4. Access Applications

- ArgoCD: Access via the LoadBalancer URL from the script output
- Applications: Access via the Ingress URLs from the script output
- Grafana: Access via the LoadBalancer URL from the script output (default credentials: admin/prom-operator)