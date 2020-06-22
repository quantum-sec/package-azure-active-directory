output "application_id" {
  description = "The application (client) ID of this application."
  value       = azuread_application.app.application_id
}

output "object_id" {
  description = "The Azure AD object ID of this application."
  value       = azuread_application.app.object_id
}

output "password_key_id" {
  description = "The key ID for the service principal password."
  value       = azuread_application_password.password.id
}
