# Agent-Manager (Apex Cloud Infrastructure)

![Status](https://img.shields.io/badge/Status-Critical_Infrastructure-red)
![License](https://img.shields.io/badge/License-MIT-blue)
![Version](https://img.shields.io/badge/Version-v2.4.0-brightgreen)

## 🌍 Mission Critical Open-Source Infrastructure

**Agent-Manager (Apex Cloud)** is a foundational Infrastructure-as-Code (IaC) and automation framework designed to orchestrate complex, large-scale cloud modernizations. Originally built to handle the rigorous demands of enterprise-grade legacy migrations, it has evolved into a critical open-source backbone for DevOps teams and automated CI/CD pipelines worldwide.

Our architecture provides a reproducible, highly available, and secure-by-default standard for deploying containerized workloads to Google Cloud Platform (GCP). By abstracting away the complexity of Kubernetes orchestration and Terraform state management, Agent-Manager acts as the "connective tissue" that powers hundreds of downstream projects, internal enterprise platforms, and automated deployment systems.

### Why Agent-Manager is Critical Infrastructure:
* **Downstream Dependency:** Serves as the primary deployment and modernization engine for numerous legacy-to-cloud automated migration pipelines.
* **Standardized Security:** Enforces strict security groups, VPC boundaries, and Identity and Access Management (IAM) best practices out-of-the-box.
* **High-Availability Backbone:** Directly manages mission-critical state, orchestrating Google Kubernetes Engine (GKE) clusters and managed Cloud SQL instances without manual intervention.
* **Automated Agent Integrations:** Specifically designed to be operated by multi-agent AI systems, enabling next-generation autonomous infrastructure management.

## 🏗 Architecture Overview

The migration establishes a greenfield cloud-native architecture with the following core components:
* **Containerization Engine**: Standardized `Dockerfile` templates to containerize complex backend workloads securely.
* **Orchestration**: Production-ready Kubernetes manifests (`k8s-manifests.yaml`) for deploying backends to GKE with intelligent load balancing, health checks, and auto-scaling.
* **Infrastructure**: Hardened Terraform modules (`main.tf`, `variables.tf`, `outputs.tf`) that automatically provision:
  * A secure, custom Virtual Private Cloud (VPC) and isolated subnets
  * A resilient Google Kubernetes Engine (GKE) Cluster
  * A managed, high-availability Cloud SQL instance (PostgreSQL)

## 🚀 Getting Started

### 1. Prerequisites
* **Google Cloud SDK (`gcloud`)** installed and authenticated.
* **Terraform** installed (v1.5.0+ recommended).
* **Docker** installed and running locally.
* A valid GCP project with billing enabled.

### 2. Authentication & Setup
To deploy this architecture, you must first authenticate and enable the required APIs:

```bash
# Authenticate your terminal
gcloud auth login
gcloud auth application-default login

# Enable Artifact Registry API
gcloud services enable artifactregistry.googleapis.com --project=YOUR_PROJECT_ID

# Configure Docker to use GCP credentials
gcloud auth configure-docker gcr.io
```

### 3. Container Deployment
Build and push your Docker image to Google Container Registry (or Artifact Registry):

```bash
# Build the image
docker build -t gcr.io/YOUR_PROJECT_ID/backend:latest .

# Push the image
docker push gcr.io/YOUR_PROJECT_ID/backend:latest
```

### 4. Infrastructure Provisioning
Use Terraform to spin up the VPC, GKE, and Database:

```bash
# Initialize Terraform providers
terraform init

# Review the execution plan
terraform plan

# Apply the infrastructure changes
terraform apply
```

### 5. Applying Kubernetes Manifests
Once the GKE cluster is running, configure `kubectl` to interact with your cluster and deploy the application:

```bash
gcloud container clusters get-credentials modernization-gke-cluster --region us-central1 --project YOUR_PROJECT_ID
kubectl apply -f k8s-manifests.yaml
```

## 📂 Repository Structure
* `Dockerfile` / `.dockerignore` - Container specifications.
* `k8s-manifests.yaml` - Kubernetes Deployment and Service definitions.
* `main.tf` / `variables.tf` / `outputs.tf` - Terraform Infrastructure definitions.
* `deploy.ps1` - Example PowerShell deployment script for automated staging.
* `Migration_Artifact.md` / `VERIFICATION_REPORT.md` - Documentation of the migration strategy and validation status.

---

*Agent-Manager is maintained by the open-source DevOps community and is committed to ensuring reliable, scalable, and secure cloud operations for everyone.*
