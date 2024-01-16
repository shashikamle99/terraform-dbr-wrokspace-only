data "aws_cloudformation_stack" "cft" {
  name = "CredentialsId"
}

data "aws_cloudformation_stack" "cft1" {
  name = "StorageConfigId"
}

# output "databricks_account_id" {
#   value = data.aws_ssm_parameter.dbr_account_id.value
#   sensitive = true
# }

# locals {
#     client_id = data.aws_ssm_parameter.client_id.value
    
# }



resource "databricks_mws_workspaces" "this" {
  provider       = databricks.mws
  account_id     = var.databricks_account_id
  aws_region     = var.region
  workspace_name = var.workspace_name
  credentials_id           = data.aws_cloudformation_stack.cft.CredentialsId.value
  storage_configuration_id = data.aws_cloudformation_stack.cft1.StorageConfigId.value
  # network_id               = databricks_mws_networks.this.network_id

  # token {
  #   comment = "Terraform"
  # }
}