terraform {
  required_version = ">= 1.2"
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.22.0"
    }
  }
}

module "azuread_app" {
  source       = "../../modules/azuread-application"
  display_name = "exampleadapplication"
}

module "azuread-service-principal" {
  source = "../../modules/azuread-service-principal"

  application_id = module.azuread_app.application_id
}

output "password" {
  value     = module.azuread-service-principal.password
  sensitive = true
}

output "key_id" {
  value = module.azuread-service-principal.password_key_id
}
