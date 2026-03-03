resource "google_container_node_pool" "system_pool" {
  name       = "system-pool"
  cluster    = google_container_cluster.primary.name
  location   = var.region
  node_count = 1

  autoscaling {
    min_node_count = 1
    max_node_count = 3
  }

  node_config {
    machine_type = "e2-standard-4"
    disk_size_gb = 100
    service_account = var.gke_nodes_sa

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    shielded_instance_config {
      enable_secure_boot          = true
      enable_integrity_monitoring = true
    }
  }
}
