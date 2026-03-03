resource "random_id" "suffix" {
  byte_length = 2
}

resource "google_project" "logging_project" {
  name            = "central-logging-project"
  project_id      = "central-logging-${random_id.suffix.hex}"
  billing_account = var.billing_account
}

# Enable Logging API
resource "google_project_service" "logging_api" {
  service = "logging.googleapis.com"
  project = google_project.logging_project.project_id
}

# Log Bucket with 30-day retention (GDPR aligned)
resource "google_logging_project_bucket_config" "central_bucket" {
  project        = google_project.logging_project.project_id
  location       = "europe-west3"
  retention_days = 30
  bucket_id      = "central-log-bucket"
}
