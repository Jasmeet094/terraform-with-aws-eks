# Define Local Values in Terraform
locals {
  team = var.team
  environment = var.environment
  name = "${var.team}-${var.environment}"
  common_tags = {
    owners = local.team
    environment = local.environment
  }
} 