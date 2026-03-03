module "gke" {
  source       = "../../gke-platform"
  project_id   = module.org_structure.network_project_id
  environment  = var.environment
  network      = module.shared_vpc.network_name
  subnetwork   = "primary-subnet"
  gke_nodes_sa = module.iam_baseline.gke_nodes_sa_email
}
