# Service Principal Variables

variable "client_id" {
  description = "Client ID (APP ID) of the application"
  type        = string
}

variable "client_secret" {
  description = "Client Secret (Password) of the application"
  type        = string
}

variable "subscription_id" {
  description = "Subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "Tenant ID"
  type        = string
}

variable "user_object_id" {
  type    = string
  default = "eea6db2a-243d-4da9-9450-e7d8be7a9ad0"
}