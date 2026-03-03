output "terraform_sa_email" {
  value = google_service_account.terraform_sa.email
}

output "gke_nodes_sa_email" {
  value = google_service_account.gke_nodes_sa.email
}
