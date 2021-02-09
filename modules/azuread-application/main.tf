# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY AN AZURE AD APP REGISTRATION
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.12"

  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 1.3"
    }
  }
}

resource "azuread_application" "app" {
  display_name               = var.name
  homepage                   = var.homepage
  identifier_uris            = var.identifier_uris
  reply_urls                 = var.reply_urls
  logout_url                 = var.logout_url
  available_to_other_tenants = var.available_to_other_tenants
  public_client              = var.public_client
  oauth2_allow_implicit_flow = var.oauth2_allow_implicit_flow
  group_membership_claims    = var.group_membership_claims
  owners                     = var.owners
  type                       = var.type

  dynamic "oauth2_permissions" {
    for_each = var.oauth2_permissions

    content {
      admin_consent_description  = oauth2_permissions.value.admin_consent_description
      admin_consent_display_name = oauth2_permissions.value.admin_consent_display_name
      value                      = oauth2_permissions.value.value
      type                       = oauth2_permissions.value.type
      is_enabled                 = oauth2_permissions.value.is_enabled
      user_consent_description   = oauth2_permissions.value.user_consent_description
      user_consent_display_name  = oauth2_permissions.value.user_consent_display_name
    }
  }
}

resource "azuread_application_password" "password" {
  count = var.password == null ? 0 : 1

  application_object_id = azuread_application.app.object_id
  description           = var.credential_description
  value                 = var.password
  end_date_relative     = var.credential_relative_end_date
}
