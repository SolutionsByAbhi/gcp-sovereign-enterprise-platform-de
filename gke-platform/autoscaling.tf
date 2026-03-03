resource "google_container_cluster" "autoscaling_config" {
  name     = google_container_cluster.primary.name
  location = var.region
  project  = var.project_id

  cluster_autoscaling {
    enabled = true

    resource_limits {
      resource_type = "cpu"
      minimum       = 1
      maximum       = 20
    }

    resource_limits {
      resource_type = "memory"
      minimum       = 2
      maximum       = 100
    }
  }
}
