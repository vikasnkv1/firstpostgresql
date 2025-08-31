variable "gcp_project_id" {
  type        = string
  description = "The GCP project ID to deploy to. This value will be supplied by the CI/CD pipeline."
}

variable "gcp_region" {
  type        = string
  description = "The GCP region for the Cloud SQL instance."
  default     = "us-central1"
}

variable "db_instance_name" {
  type        = string
  description = "The name of the Cloud SQL instance."
  default     = "my-postgres-instance-1"
}

variable "db_tier" {
  type        = string
  description = "The machine type for the database."
  default     = "db-f1-micro" # This is a small, inexpensive tier suitable for testing.
}
