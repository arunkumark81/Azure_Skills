terraform {
  #required_version = "= 0.14.9"

  required_providers {
    azurerm = {
      source  = "azurerm"
      version = "=2.97.0"
    }


    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.7.0"
    }

  }
}

provider "azurerm" {
  features {}
  subscription_id   = "7a5e5406-b6cd-4eed-8f3c-daa8a193dea5"
  tenant_id         = "ca4ba532-d728-4ae1-943d-a0efa3e0341c"
  client_id         = "1185975e-39f3-4e53-ab38-71e4f3ea501f"
  client_secret     = "M.J8Q~yEqvA4RIwNS8y.O5DI3hGMVtFh.jpvKcoH"
}
