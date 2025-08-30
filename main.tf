# Configure the Google Cloud provider
terraform {
required_providers {
google = {
source = "hashicorp/google"

version = "4.51.0"
}
}
}
provider "google" {
project = var.gcp_project_id
region = var.gcp_region
// The credentials will be provided by the CI/CD pipeline later
}
# Resource to create a random password for the database
resource "random_password" "db_password" {
length = 16
special = false # Some special characters are not allowed
}
# Resource for the Cloud SQL PostgreSQL instance
resource "google_sql_database_instance" "postgres_instance" {
name = var.db_instance_name
database_version = "POSTGRES_14"
region = var.ggcp_region
settings {
tier = "db-f1-micro" # Use a small tier for this example
}
# Set the master user's password using our random password
root_password = random_password.db_password.result
}
