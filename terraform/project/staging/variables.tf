
variable "project_id" {
  type    = string
  default = "chess-test-webapp-5"
}

variable "region" {
  description = "The region to host the database in."
  type        = string
  default     = "uerope-central2"
}

variable "zone" {
  description = "The zone to host the database in."
  type        = string
  default     = "uerope-central2-a"
}
