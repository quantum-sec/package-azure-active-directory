# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY AN AZURE AD SERVICE PRINCIPAL
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.12"
}

resource "azuread_service_principal" "service_principal" {
  application_id               = var.application_id
  app_role_assignment_required = var.app_role_assignment_required
}

resource "azuread_service_principal_password" "password" {
  depends_on = [azuread_service_principal.service_principal]

  service_principal_id = azuread_service_principal.service_principal.id
  value                = var.password
  end_date_relative    = var.end_date_relative
}
