output "name" {
  description = "The name of the user assigned identity."
  value       = var.name
}

output "identity" {
  description = "The identity of user assigned identity."
  value       = azurerm_user_assigned_identity.identity
}

output "object" {
  description = "The user assigned identity object."
  value       = azurerm_user_assigned_identity
}
