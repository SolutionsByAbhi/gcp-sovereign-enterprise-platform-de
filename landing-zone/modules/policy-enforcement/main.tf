# Restrict to EU regions only
resource "google_org_policy_policy" "eu_regions_only" {
  name   = "organizations/${var.org_id}/policies/gcp.resourceLocations"

  spec {
    rules {
      allow_all = false
      values {
        allowed_values = [
          "in:europe-west3",
          "in:europe-west1",
          "in:europe-west4"
        ]
      }
    }
  }
}

# Disable public IPs on VMs
resource "google_org_policy_policy" "no_public_ip" {
  name = "organizations/${var.org_id}/policies/compute.vmExternalIpAccess"

  spec {
    rules {
      deny_all = true
    }
  }
}

# Enforce OS Login
resource "google_org_policy_policy" "require_os_login" {
  name = "organizations/${var.org_id}/policies/compute.requireOsLogin"

  spec {
    rules {
      enforce = true
    }
  }
}
