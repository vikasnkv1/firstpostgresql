output "instance_connection_name" {
  description = "The connection name of the Cloud SQL instance, used for connecting via the Cloud SQL Proxy."
  value       = google_sql_database_instance.postgres_instance.connection_name
}

output "instance_public_ip_address" {
  description = "The public IP address of the Cloud SQL instance."
  value       = google_sql_database_instance.postgres_instance.public_ip_address
  # Note: You may need to configure authorized networks to connect to this IP.
}
