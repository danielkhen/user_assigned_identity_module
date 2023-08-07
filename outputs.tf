output "name" {
  description = "The name of the user assigned identity."
  value       = var.name
}

output "id" {
  description = "The id of user assigned identity."
  value       = azurerm_user_assigned_identity.identity.id
}

output "object" {
  description = "The user assigned identity object."
  value       = azurerm_user_assigned_identity.identity
}
