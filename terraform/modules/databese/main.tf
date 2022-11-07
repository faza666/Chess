

resource "google_sql_database_instance" "db_instance" {
  name                = var.sql_server_name
  database_version    = var.sql_server_version
  root_password       = random_string.sql_instance_root_password.result
  deletion_protection = false
  depends_on = [var.network_connection]

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
      private_network = var.default_network_id
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
  password = data.google_secret_manager_secret_version.db_password.secret_data
}


resource "random_string" "sql_instance_root_password" {
  length            = 12
  special           = true
  override_special  = "!@#%&^(){}[]"
}

data "google_secret_manager_secret_version" "db_password" {
    secret  = "chess-db-user-password"
}