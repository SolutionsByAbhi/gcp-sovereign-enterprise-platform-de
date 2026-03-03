module "org_structure" {
  source          = "./modules/org-structure"
  org_id          = var.org_id
  billing_account = var.billing_account
  environment     = var.environment
}

module "shared_vpc" {
  source      = "./modules/shared-vpc"
  project_id  = module.org_structure.network_project_id
  region      = var.region
}

module "budget" {
  source          = "./modules/budget-alerts"
  billing_account = var.billing_account
}
