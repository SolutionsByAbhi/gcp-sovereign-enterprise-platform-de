terraform {
  backend "gcs" {
    bucket = "terraform-state-dev"
    prefix = "landing-zone"
  }
}
