locals {
  thresholds = [50, 80, 100]
}

resource "random_string" "random" {
  length  = 4
  special = false
  upper   = false
}

resource "azurerm_consumption_budget_resource_group" "default" {
  name              = "cbrg-${random_string.random.result}-${var.environment}-${var.name}"
  resource_group_id = data.azurerm_resource_group.default.id
  amount            = var.budget
  time_grain        = "Monthly"

  time_period {
    start_date = formatdate("YYYY-MM-01'T'00:00:00Z", timestamp())
  }

  dynamic "notification" {
    for_each = local.thresholds

    content {
      enabled        = true
      threshold      = notification.value
      operator       = "GreaterThanOrEqualTo"
      threshold_type = "Actual"
      contact_roles  = ["Owner"]
      contact_emails = [var.owner_email]
    }
  }

  lifecycle {
    ignore_changes = all
  }

  depends_on = [data.azurerm_resource_group.default, random_string.random]
}