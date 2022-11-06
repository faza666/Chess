
output "db_name" {
  description = "The name for Cloud SQL instance"
  value       = var.sql_server_name
}

output "mssql_connection_name" {
  value       = google_sql_database_instance.db_instance.connection_name
  description = "The connection name of the master instance to be used in connection strings"
}

output "db_private_ip_address" {
  value       = google_sql_database_instance.db_instance.private_ip_address
  description = "private ip address"
}
