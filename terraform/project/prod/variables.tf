
variable "project_id" {
  type    = string
  default = "chess-web-app-prod"
}

variable "region" {
  description = "The region to host the database in."
  type        = string
  default     = "us-east1"
}

variable "zone" {
  description = "The zone to host the database in."
  type        = string
  default     = "us-east1-a"
}
