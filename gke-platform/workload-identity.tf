resource "google_service_account" "app_sa" {
  account_id   = "app-workload-sa"
  display_name = "App Workload Identity SA"
  project      = var.project_id
}

resource "google_service_account_iam_member" "workload_identity_binding" {
  service_account_id = google_service_account.app_sa.name
  role               = "roles/iam.workloadIdentityUser"
  member = "serviceAccount:${var.project_id}.svc.id.goog[default/app-sa]"
}
