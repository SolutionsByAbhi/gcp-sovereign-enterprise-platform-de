resource "google_billing_budget" "monthly_budget" {
  billing_account = var.billing_account
  display_name    = "monthly-budget"

  budget_filter {}

  amount {
    specified_amount {
      currency_code = "EUR"
      units         = "1000"
    }
  }

  threshold_rules {
    threshold_percent = 0.8
  }
}
