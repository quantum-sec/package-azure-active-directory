variable "name" {
  description = "The display name for the application."
  type        = string
}

variable "homepage" {
  description = "The URL to the application's home page. If no homepage is specified this defaults to `https://{name}`."
  type        = string
  default     = null
}

variable "identifier_uris" {
  description = "A set of user-defined URI(s) that uniquely identify a Web application with its Azure AD tenant, or within a verified custom domain if the application is multi-tenant."
  type        = set(string)
  default     = []
}

variable "reply_urls" {
  description = "A set of URLs that user tokens are sent to for sign in, or the redirect URIs that OAuth 2.0 authorization codes and access tokens are sent to."
  type        = set(string)
  default     = []
}

variable "logout_url" {
  description = "The URL of the logout page."
  type        = string
  default     = null
}

variable "available_to_other_tenants" {
  description = "Whether or not this Azure AD application is available to other tenants."
  type        = bool
  default     = false
}

variable "public_client" {
  description = "Whether or not this Azure AD application is a public client."
  type        = bool
  default     = false
}

variable "oauth2_allow_implicit_flow" {
  description = "Whether or not the OAuth 2.0 implicit flow is allowed for this application."
  type        = bool
  default     = false
}

variable "group_membership_claims" {
  description = "Configures the `groups` claim issued in a user or OAuth 2.0 access token that the app expects. One of `None`, `SecurityGroup`, `DirectoryRole`, `ApplicationGroup`, or `All`."
  type        = string
  default     = "SecurityGroup"
}

variable "owners" {
  description = "A set of Azure AD object IDs that will be granted ownership of the application."
  type        = set(string)
}

variable "type" {
  description = "The type of the application. One of `webapp/api` or `native`."
  type        = string
}

variable "oauth2_permissions" {
  description = "A set of OAuth 2.0 permission scopes granted to clients."
  type = set(object({
    admin_consent_description  = string
    admin_consent_display_name = string
    value                      = string
    type                       = string
    is_enabled                 = bool
    user_consent_description   = string
    user_consent_display_name  = string
  }))
  default = []
}

variable "password" {
  description = "The application password (client secret) used to authenticate the application for token requests."
  type        = string
}

variable "password_end_date_relative" {
  description = "A relative duration for which the password is valid until."
  type        = string
  default     = "17520h"
}

variable "password_description" {
  description = "A description for the application password. Note that this maps to the `CustomKeyIdentifier` property of the `PasswordCredentials` API resource."
  type        = string
  default     = "rbac"
}
