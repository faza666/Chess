
data "google_compute_network" "default_network" {
  name = "default"
}


resource "google_compute_global_address" "private_ip_address" {
  name          = "private-ip-address"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = data.google_compute_network.default_network.id
}


resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = data.google_compute_network.default_network.name
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
}
