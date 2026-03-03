resource "google_folder" "env_folder" {
  display_name = var.environment
  parent       = "organizations/${var.org_id}"
}

resource "google_project" "network_project" {
  name            = "${var.environment}-network-project"
  project_id      = "${var.environment}-network-${random_id.suffix.hex}"
  folder_id       = google_folder.env_folder.name
  billing_account = var.billing_account
}

resource "random_id" "suffix" {
  byte_length = 2
}
