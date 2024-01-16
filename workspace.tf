data "aws_cloudformation_stack" "this" {
  name = "databricks-workspace-stack-bfe39"
}

data "aws_s3_bucket" "existing_bucket" {
  # bucket = "sumeet.life"
}

resource "databricks_mws_workspaces" "this" {
  provider       = databricks.mws
  account_id     = local.databricks_account_id
  aws_region     = var.region
  workspace_name = var.workspace_name
  credentials_id           = data.aws_cloudformation_stack.this.outputs["CredentialsId"]
  storage_configuration_id = data.aws_cloudformation_stack.this.outputs["StorageConfigId"]
 # network_id               = data.aws_cloudformation_stack.this.network_id

  token {
    comment = "Terraform"
  }
}