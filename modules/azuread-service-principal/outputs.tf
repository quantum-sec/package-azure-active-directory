output "id" {
  description = "The ID of the service principal."
  value       = azuread_service_principal.service_principal.id
}

output "object_id" {
  description = "The Azure AD object ID of the service principal."
  value       = azuread_service_principal.service_principal.object_id
}

output "display_name" {
  description = "The display name of the Azure AD application associated with this service principal."
  value       = azuread_service_principal.service_principal.display_name
}

output "app_role_assignment_required" {
  description = "Whether or not this service principal requires an AppRoleAssignment to a user or group before Azure AD will issue a user or access token to the application."
  value       = azuread_service_principal.service_principal.app_role_assignment_required
}

output "oauth2_permissions" {
  description = "A collection of OAuth 2.0 permissions exposed by the associated application."
  value       = azuread_service_principal.service_principal.oauth2_permissions
}
