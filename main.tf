# Enforce Terraform version and required providers
terraform {
  required_version = ">= 1.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0" # Use any version in the 4.x family
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

# Configure the Google Cloud provider
provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
}

# Resource to create a secure, random password for the database
resource "random_password" "db_password" {
  length  = 16
  special = false # Cloud SQL root password does not allow certain special characters
}

# The Cloud SQL for PostgreSQL instance resource
resource "google_sql_database_instance" "postgres_instance" {
  name             = var.db_instance_name
  database_version = "POSTGRES_14"
  region           = var.gcp_region

  settings {
    tier = var.db_tier
  }

  # Set the master user's password using our random password
  # Note: The 'postgres' user is the default root user
  root_password = random_password.db_password.result
}
