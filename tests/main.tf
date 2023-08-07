locals {
  location            = "westeurope"
  resource_group_name = "dtf-storage-account-test"
}

resource "azurerm_resource_group" "test_rg" {
  name     = local.resource_group_name
  location = local.location

  lifecycle {
    ignore_changes = [tags["CreationDateTime"], tags["Environment"]]
  }
}

locals {
  activity_log_analytics_name           = "activity-monitor-log-workspace"
  activity_log_analytics_resource_group = "dor-hub-n-spoke"
}

data "azurerm_log_analytics_workspace" "activity" {
  name                = local.activity_log_analytics_name
  resource_group_name = local.activity_log_analytics_resource_group
}

locals {
  name = "identity"

  role_assignemnts = [
    {
      name  = "log-analytics-reader"
      scope = data.azurerm_log_analytics_workspace.activity.id
      role  = "Reader"
    }
  ]
}

module "user_assigned_identity" {
  source = "../"

  name                = local.name
  location            = local.location
  resource_group_name = azurerm_resource_group.test_rg.name
  role_assignments = local.role_assignemnts
}