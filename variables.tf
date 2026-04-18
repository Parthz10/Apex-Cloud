variable "project_id" {
  description = "The GCP project ID"
  type        = string
  default     = "solid-acrobat-456503-p0"
}

variable "region" {
  description = "The GCP region to deploy resources into"
  type        = string
  default     = "us-central1"
}
