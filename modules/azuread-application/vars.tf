variable "display_name" {
  description = "The display name for the application."
  type        = string
}

variable "homepage_url" {
  description = "The URL to the application's home page. If no homepage is specified this defaults to `https://{name}`."
  type        = string
  default     = null
}

variable "identifier_uris" {
  description = "A set of user-defined URI(s) that uniquely identify a Web application with its Azure AD tenant, or within a verified custom domain if the application is multi-tenant."
  type        = set(string)
  default     = []
}

variable "redirect_uris" {
  description = "A set of URLs that user tokens are sent to for sign in, or the redirect URIs that OAuth 2.0 authorization codes and access tokens are sent to."
  type        = set(string)
  default     = []
}

variable "logout_url" {
  description = "The URL of the logout page."
  type        = string
  default     = null
}

variable "sign_in_audience" {
  description = "The Microsoft account types that are supported for the current application."
  type        = string
  default     = "AzureADMyOrg"
  validation {
    condition = contains([
      "AzureADMyOrg",
      "AzureADMultipleOrgs",
      "AzureADandPersonalMicrosoftAccount",
      "PersonalMicrosoftAccount"],
    var.sign_in_audience)
    error_message = "Allowed values for input_parameter are \"AzureADMyOrg\", \"AzureADMultipleOrgs\", \"AzureADandPersonalMicrosoftAccount\" or \"PersonalMicrosoftAccount\"."
  }
}

variable "fallback_public_client_enabled" {
  description = "Whether or not this Azure AD application is a public client."
  type        = bool
  default     = false
}

variable "oauth2_implicit_flow_allow_access_token" {
  description = "Whether or not application can request an access token using OAuth 2.0 implicit flow."
  type        = bool
  default     = false
}

variable "group_membership_claims" {
  description = "Configures the `groups` claim issued in a user or OAuth 2.0 access token that the app expects. One of `None`, `SecurityGroup`, `DirectoryRole`, `ApplicationGroup`, or `All`."
  type        = string
  default     = null
}

variable "owners" {
  description = "A set of Azure AD object IDs that will be granted ownership of the application."
  type        = set(string)
  default     = null
}

variable "oauth2_permission_scopes" {
  description = "A set of OAuth 2.0 permission scopes granted to clients."
  type = set(object({
    admin_consent_description  = string
    admin_consent_display_name = string
    value                      = string
    type                       = string
    enabled                    = bool
    user_consent_description   = string
    user_consent_display_name  = string
  }))
  default = []
}
