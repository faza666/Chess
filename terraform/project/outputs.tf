
 output "project_id" {
  value = var.project_id
}

output "database_ip_address" {
  value = module.database.db_private_ip_address
}