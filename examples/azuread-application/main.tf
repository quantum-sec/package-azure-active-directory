terraform {
  required_version = ">= 0.12.26"
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.22.0"
    }
  }
}

module "azuread_application" {
  source = "../../modules/azuread-application"

  display_name                            = var.name
  homepage_url                            = var.homepage_url
  identifier_uris                         = var.identifier_uris
  redirect_uris                           = var.redirect_uris
  logout_url                              = var.logout_url
  sign_in_audience                        = var.sign_in_audience
  fallback_public_client_enabled          = var.fallback_public_client_enabled
  oauth2_implicit_flow_allow_access_token = var.oauth2_implicit_flow_allow_access_token
  group_membership_claims                 = var.group_membership_claims
  owners                                  = var.owners
  oauth2_permission_scopes                = var.oauth2_permission_scopes
}
