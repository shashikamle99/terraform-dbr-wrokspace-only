
resource "databricks_mws_credentials" "dbr_mws_cred" {
  provider         = databricks.mws
  account_id       = local.databricks_account_id
  role_arn         = data.aws_cloudformation_stack.aws_cf_stack.outputs["WorkspaceIamRoleArn"]
  credentials_name = var.mws_credential_name
}


