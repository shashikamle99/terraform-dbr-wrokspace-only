# data "databricks_mws_credentials" "this" {}

# data "databricks_mws_storage_configurations" "this" {}

# output "databricks_account_id" {
#   value = data.aws_ssm_parameter.dbr_account_id.value
#   sensitive = true
# }


data "aws_cloudformation_export" "this" {
  name = "credentials_id"
}

data "aws_cloudformation_export" "this1" {
  name = "storage_configuration_id"
}



locals {
    credentials_id  = data.aws_cloudformation_export.this.value
    storage_configuration_id  = data.aws_cloudformation_export.this1.value
}

# data "databricks_mws_credentials" "this" {}


resource "databricks_mws_workspaces" "this" {
  provider       = databricks.mws
  account_id     = var.databricks_account_id
  aws_region     = var.region
  workspace_name = var.workspace_name
  credentials_id           = local.credentials_id 
  storage_configuration_id = local.storage_configuration_id
  # network_id               = "vpc-0a4de24baa0911126"

  # token {
  #   comment = "Terraform"
  # }
}