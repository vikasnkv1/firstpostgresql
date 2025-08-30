variable "gcp_project_id" {
type = string
description = "The GCP project ID to deploy to."
}
variable "gcp_region" {
type = string
description = "The GCP region to deploy to."
default = "us-central1"
}
variable "db_instance_name" {
type = string
description = "The name of the Cloud SQL instance."
default = "my-postgres-instance"
}
