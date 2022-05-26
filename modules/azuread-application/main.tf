# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY AN AZURE AD APP REGISTRATION
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.12"

  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.22"
    }
  }
}

resource "azuread_application" "app" {
  display_name    = var.display_name
  identifier_uris = var.identifier_uris

  group_membership_claims = var.group_membership_claims
  owners                  = var.owners

  sign_in_audience               = var.sign_in_audience
  fallback_public_client_enabled = var.fallback_public_client_enabled

  web {
    homepage_url  = var.homepage_url
    logout_url    = var.logout_url
    redirect_uris = var.redirect_uris

    implicit_grant {
      access_token_issuance_enabled = var.oauth2_implicit_flow_allow_access_token
    }
  }

  api {
    dynamic "oauth2_permission_scope" {
      for_each = var.oauth2_permission_scopes

      content {
        admin_consent_description  = oauth2_permission_scope.value.admin_consent_description
        admin_consent_display_name = oauth2_permission_scope.value.admin_consent_display_name
        value                      = oauth2_permission_scope.value.value
        type                       = oauth2_permission_scope.value.type
        enabled                    = oauth2_permission_scope.value.enabled
        user_consent_description   = oauth2_permission_scope.value.user_consent_description
        user_consent_display_name  = oauth2_permission_scope.value.user_consent_display_name
        id                         = uuid()
      }
    }
  }
}
