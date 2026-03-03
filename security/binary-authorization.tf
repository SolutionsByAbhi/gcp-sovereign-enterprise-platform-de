resource "google_binary_authorization_policy" "policy" {
  admission_whitelist_patterns {
    name_pattern = "gcr.io/*"
  }

  default_admission_rule {
    enforcement_mode = "ENFORCED_BLOCK_AND_AUDIT_LOG"
  }
}
resource "google_binary_authorization_policy" "enforce_signed_images" {
  default_admission_rule {
    evaluation_mode = "REQUIRE_ATTESTATION"
    enforcement_mode = "ENFORCED_BLOCK_AND_AUDIT_LOG"
  }
}
