variable "bootstrap_project" {
  type = string
}

variable "org_id" {
  type = string
}

variable "billing_account" {
  type = string
}

variable "region" {
  type    = string
  default = "europe-west3"
}

variable "environment" {
  type = string
}
