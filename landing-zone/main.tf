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
module "iam_baseline" {
  source      = "./modules/iam-baseline"
  project_id  = module.org_structure.network_project_id
  environment = var.environment
}

module "logging" {
  source          = "./modules/logging-centralization"
  org_id          = var.org_id
  billing_account = var.billing_account
}

module "org_policies" {
  source = "./modules/policy-enforcement"
  org_id = var.org_id
}
