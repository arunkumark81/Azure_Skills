provider "azuread" {
   tenant_id         = "ca4ba532-d728-4ae1-943d-a0efa3e0341c"
  client_id         = "1185975e-39f3-4e53-ab38-71e4f3ea501f"
  client_secret     = "M.J8Q~yEqvA4RIwNS8y.O5DI3hGMVtFh.jpvKcoH"
}


resource "azurerm_resource_group" "rg-kv" {
  location = "eastus"
  name     = "rg-kv"
}

resource "azurerm_key_vault" "azkv00100" {
  location            = azurerm_resource_group.rg-kv.location
  name                = "azkv00100"
  resource_group_name = azurerm_resource_group.rg-kv.name
  sku_name            = "standard"
  tenant_id           = "ca4ba532-d728-4ae1-943d-a0efa3e0341c"
}

resource "azuread_application" "azkv_app" {
  display_name = "azkv_app"



}
resource "azuread_service_principal" "sp" {
  application_id = azuread_application.azkv_app.application_id
}
resource "azurerm_role_assignment" "Contributor_Role" {
  principal_id = azuread_service_principal.sp.object_id
  scope        = azurerm_resource_group.rg-kv.id
  role_definition_name = "Contributor"

}

resource "azurerm_key_vault_access_policy" "ap" {
  key_vault_id = azurerm_key_vault.azkv00100.id
  tenant_id = "ca4ba532-d728-4ae1-943d-a0efa3e0341c"
  object_id = azuread_service_principal.sp.object_id
  key_permissions    = ["get", "unwrapkey", "wrapkey"]

}