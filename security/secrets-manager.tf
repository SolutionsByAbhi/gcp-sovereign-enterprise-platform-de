resource "google_secret_manager_secret" "app_secret" {
  secret_id = "app-secret"
  replication {
    automatic = true
  }
}
