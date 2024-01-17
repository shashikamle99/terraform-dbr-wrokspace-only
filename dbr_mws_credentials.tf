resource "databricks_mws_credentials" "this" {
  provider         = databricks.mws
  account_id       = local.databricks_account_id
  role_arn         = data.aws_cloudformation_stack.this.outputs["WorkspaceIamRoleArn"]
  credentials_name = var.mws_credential_name
}


