
resource "databricks_mws_workspaces" "dbr_msw_ws" {
  provider       = databricks.mws
  account_id     = local.databricks_account_id
  aws_region     = var.region
  workspace_name = var.workspace_name
  credentials_id           = databricks_mws_credentials.dbr_mws_cred.credentials_id
  storage_configuration_id = data.aws_cloudformation_stack.aws_cf_stack.outputs["StorageConfigId"]
  network_id               = databricks_mws_networks.dbr_mws_networks.network_id

  token {
    comment = "Terraform"
  }
}




