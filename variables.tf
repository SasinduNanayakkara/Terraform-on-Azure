variable "resource_group_name" {
  type        = string
  description = "value of resource group name"
}

variable "resource_group_location" {
  type        = string
  description = "value of resource group location"
}

variable "environment" {
  type        = string
  description = "value of enviroment"
}

variable "app_service_plan_name" {
  type        = string
  description = "value of app service plan name"
}

variable "app_service_name" {
  type        = string
  description = "value of app service name"
}

variable "mssql_server_name" {
  type        = string
  description = "value of mssql server name"
}

variable "mssql_database_name" {
  type        = string
  description = "value of mssql database name"
}

variable "mssql_server_username" {
  type        = string
  description = "value of mssql server username"
}

variable "mssql_server_password" {
  type        = string
  description = "value of mssql server password"
}
