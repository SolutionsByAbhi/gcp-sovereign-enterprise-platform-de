# Terraform Service Account
resource "google_service_account" "terraform_sa" {
  account_id   = "terraform-${var.environment}"
  display_name = "Terraform Service Account"
  project      = var.project_id
}

# GKE Node Service Account
resource "google_service_account" "gke_nodes_sa" {
  account_id   = "gke-nodes-${var.environment}"
  display_name = "GKE Node Service Account"
  project      = var.project_id
}

# IAM Bindings (Least Privilege)

resource "google_project_iam_member" "terraform_admin" {
  project = var.project_id
  role    = "roles/editor"
  member  = "serviceAccount:${google_service_account.terraform_sa.email}"
}

resource "google_project_iam_member" "gke_node_logging" {
  project = var.project_id
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.gke_nodes_sa.email}"
}

resource "google_project_iam_member" "gke_node_monitoring" {
  project = var.project_id
  role    = "roles/monitoring.metricWriter"
  member  = "serviceAccount:${google_service_account.gke_nodes_sa.email}"
}
