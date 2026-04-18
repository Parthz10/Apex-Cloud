 Apex Cloud Modernization

This repository contains the infrastructure-as-code and containerization files for migrating and modernizing the Apex Cloud application to a cloud-native architecture on Google Cloud Platform (GCP).

## Architecture Overview

The migration establishes a greenfield cloud-native architecture with the following components:
* **Containerization**: A `Dockerfile` is provided to containerize the Node.js backend.
* **Orchestration**: Kubernetes manifests (`k8s-manifests.yaml`) are included to deploy the backend to Google Kubernetes Engine (GKE) with proper load balancing.
* **Infrastructure**: Terraform files (`main.tf`, `variables.tf`, `outputs.tf`) are used to automatically provision:
  * A custom Virtual Private Cloud (VPC) and subnet
  * A Google Kubernetes Engine (GKE) Cluster
  * A managed Cloud SQL instance (PostgreSQL)

## Getting Started

### 1. Prerequisites
* **Google Cloud SDK (`gcloud`)** installed and authenticated.
* **Terraform** installed.
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

## Repository Structure
* `Dockerfile` / `.dockerignore` - Container specifications.
* `k8s-manifests.yaml` - Kubernetes Deployment and Service definitions.
* `main.tf` / `variables.tf` / `outputs.tf` - Terraform Infrastructure definitions.
* `deploy.ps1` - Example PowerShell deployment script for automated staging.
* `Migration_Artifact.md` / `VERIFICATION_REPORT.md` - Documentation of the migration strategy and validation status.
