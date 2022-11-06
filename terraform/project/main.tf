
provider "google" {
    /* credentials = file("${var.project_id}-creds.json") */
    project     = var.project_id
    region      = var.region
    zone        = var.zone
}



locals {
  network_connection = module.networking.network_connection
  default_network_id = module.networking.default_network_id
}

data "google_secret_manager_secret_version" "db_password" {
  secret  = "chess-db-user-password"
}

module "networking" {
  source = "../modules/networking"
}

module "database" {
  source = "../modules/databese"
  network_connection = local.network_connection
  default_network_id = local.default_network_id
  project_id = var.project_id
}
