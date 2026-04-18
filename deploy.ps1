$ErrorActionPreference = "Stop"

$env:GOOGLE_APPLICATION_CREDENTIALS="C:\Users\Dell\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\LocalCache\Roaming\gcloud\application_default_credentials.json"

Write-Host "Enabling Artifact Registry API..."
.\google-cloud-sdk\bin\gcloud.cmd services enable artifactregistry.googleapis.com --project=solid-acrobat-456503-p0

Write-Host "Configuring Docker Auth..."
.\google-cloud-sdk\bin\gcloud.cmd auth configure-docker gcr.io --quiet

Write-Host "Pushing Docker Image..."
docker push gcr.io/solid-acrobat-456503-p0/backend:latest

Write-Host "Applying Terraform..."
.\terraform.exe apply -auto-approve
