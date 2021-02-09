terraform {
  required_version = ">= 0.12.26"
  required_providers {
    aws = {
      source  = "hashicorp/azuread"
      version = "1.3.0"
    }
  }
}

module "azuread_application" {
  source = "../../modules/azuread-application"

  name                       = var.name
  homepage                   = var.homepage
  identifier_uris            = var.identifier_uris
  reply_urls                 = var.reply_urls
  logout_url                 = var.logout_url
  available_to_other_tenants = var.available_to_other_tenants
  public_client              = var.public_client
  oauth2_allow_implicit_flow = var.oauth2_allow_implicit_flow
  group_membership_claims    = var.group_membership_claims
  owners                     = var.owners
  oauth2_permissions         = var.oauth2_permissions
}
