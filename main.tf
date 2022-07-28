terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.15.1"
    }
  }
}

provider "azurerm" {
  features {}
}

# dynamic resource group
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name # set the name as variable
  location = var.resource_group_location
  tags = {
    environment = var.environment
  }
}

# dynamic app service plan
resource "azurerm_app_service_plan" "main" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  # get the resource group output name and location and assigned
  sku {
    tier = "Standard"
    size = "S1"
  }
}
# dynamic app service
resource "azurerm_app_service" "main" {
  name                = var.app_service_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  app_service_plan_id = azurerm_app_service_plan.main.id
}

# dynamic mssql server
resource "azurerm_mssql_server" "main" {
  name                         = var.mssql_server_name
  resource_group_name          = azurerm_resource_group.main.name
  location                     = azurerm_resource_group.main.location
  version                      = "12.0"
  administrator_login          = var.mssql_server_username
  administrator_login_password = var.mssql_server_password
  tags = {
    environment = var.environment
  }
}

# dynamic mssql
resource "azurerm_mssql_database" "main" {
  name         = var.mssql_database_name
  server_id    = azurerm_mssql_server.main.id
  license_type = "LicenseIncluded"

  tags = {
    environment = var.environment
  }
}