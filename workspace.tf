

data "aws_cloudformation_stack" "this" {
  name = "databricks-workspace-stack-b0ffe"
}



resource "databricks_mws_workspaces" "this" {
  provider       = databricks.mws
  account_id     = local.databricks_account_id
  aws_region     = var.region
  workspace_name = var.workspace_name
  credentials_id           = databricks_mws_credentials.this.credentials_id
  storage_configuration_id = data.aws_cloudformation_stack.this.outputs["StorageConfigId"]
  network_id               = "44408f46-7b74-4f72-8908-f058600bad11"

  token {
    comment = "Terraform"
  }
}


