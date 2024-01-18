
resource "databricks_mws_workspaces" "this" {
  provider       = databricks.mws
  account_id     = local.databricks_account_id
  aws_region     = var.region
  workspace_name = var.workspace_name
  credentials_id           = databricks_mws_credentials.this.credentials_id
  storage_configuration_id = data.aws_cloudformation_stack.this.outputs["StorageConfigId"]
  network_id               = databricks_mws_networks.this.network_id

  token {
    comment = "Terraform"
  }
}




