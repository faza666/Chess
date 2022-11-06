output "network_connection" {
  value = google_service_networking_connection.private_vpc_connection
  description = "private network connection to use with database instance"
}

output "default_network_id" {
  value = data.google_compute_network.default_network.id
}