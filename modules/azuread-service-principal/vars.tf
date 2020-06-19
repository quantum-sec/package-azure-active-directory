variable "application_id" {
  description = "The ID of the Azure AD application for which this service principal will be created."
  type        = string
}

variable "app_role_assignment_required" {
  description = "Whether or not this service principal requires an AppRoleAssignment to a user or group before Azure AD will issue a user or access token to the application."
  type        = bool
  default     = false
}

variable "password" {
  description = "The password for this service principal."
  type        = string
}
