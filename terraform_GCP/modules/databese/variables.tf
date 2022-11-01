
variable "project_id" {
  type = string
  description = "project id"
}

variable "sql_server_name" {
  type        = string
  description = "The name for Cloud SQL instance"
  default     = "chess-mssql-server-test"
}

variable "sql_server_version" {
  description = "The engine version of the database"
  type        = string
  default     = "SQLSERVER_2019_EXPRESS"
}

variable "machine_type" {
  description = "The machine type to use, see https://cloud.google.com/sql/pricing for more details"
  type        = string
  default     = "db-custom-1-3840"
}

variable "sql_instance_disk_size" {
  description = "The instance disk size in GiB"
  type        = string
  default     = 10
}

variable "availability_type" {
  description = "The availability type of the Cloud SQL instance, high availability (REGIONAL) or single zone (ZONAL)"
  type        = string
  default     = "ZONAL"
}
variable "sql_instance_disk_auto_resize" {
  description = "Defines db-instance behaivoure if disk is full"
  type        = bool
  default     = true
}
variable "sql_instance_disk_size_limit" {
  description = "If parameter 'disk_autoresize' is set to TRUE - sets the limit to resize to, in GiB"
  type        = string
  default     = 20
}

variable "network_connection" {
    description = "network connetction created in the networking module"
}

variable "default_network_id" {
  description = "default network id, with is got from 'networking' module"
}