
provider "google" {
    credentials = file("${var.project_id}-creds.json")
    project     = var.project_id
    region      = var.region
    zone        = var.zone
}


resource "google_sql_database_instance" "db_instance" {
  name                = var.sql_server_name
  database_version    = var.sql_server_version
  root_password       = random_string.sql_instance_root_password.result
  deletion_protection = false
  depends_on = [google_service_networking_connection.private_vpc_connection]

  settings {
    tier                  = var.machine_type
    availability_type     = var.availability_type
    disk_size             = var.sql_instance_disk_size
    disk_autoresize       = var.sql_instance_disk_auto_resize
    disk_autoresize_limit = var.sql_instance_disk_size_limit
    disk_type             = "PD_SSD"

    backup_configuration {
      enabled = false
    }

    ip_configuration {
      ipv4_enabled    = false
      private_network = data.google_compute_network.default_network.id
    }

    user_labels = {
      "project"     = var.project_id,
      "application" = "chess"
    }
  }
}


resource "google_sql_user" "users" {
  name     = "chess"
  instance = google_sql_database_instance.db_instance.name
  project  = var.project_id
  password = "GUb!RqUl%!Ej"
  /*password = random_string.sql_instance_user_password.result*/
}


resource "random_string" "sql_instance_root_password" {
  length            = 12
  special           = true
  override_special  = "!@#%&^(){}[]"
}


resource "random_string" "sql_instance_user_password" {
  length            = 12
  special           = true
  override_special  = "!@#%&^(){}[]"
}


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

