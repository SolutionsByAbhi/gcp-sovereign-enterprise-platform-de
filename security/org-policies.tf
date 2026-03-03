resource "google_org_policy_policy" "shielded_vm" {
  name = "organizations/${var.org_id}/policies/compute.requireShieldedVm"

  spec {
    rules {
      enforce = true
    }
  }
}
