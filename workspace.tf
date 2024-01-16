# data "aws_cloudformation_stack" "cft" {
#   name = "databricks-workspace-stack-eb289"
# }



resource "databricks_mws_workspaces" "this" {
  provider       = databricks.mws
  account_id     = var.databricks_account_id
  aws_region     = var.region
  workspace_name = var.workspace_name

  credentials_id           = "f7e6048f-2edf-4539-905e-004246a55842"
  storage_configuration_id = "855e390c-09a9-4c59-aaec-be732e5becc8"
  # network_id               = databricks_mws_networks.this.network_id

  # token {
  #   comment = "Terraform"
  # }
}