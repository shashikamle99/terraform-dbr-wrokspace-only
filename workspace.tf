# data "databricks_mws_credentials" "this" {}

# data "databricks_mws_storage_configurations" "this" {}

# output "databricks_account_id" {
#   value = data.aws_ssm_parameter.dbr_account_id.value
#   sensitive = true
# }


# data "aws_cloudformation_export" "this" {
#   name = "Credential ID"
# }

# data "aws_cloudformation_export" "this1" {
#   name = "Storage configuration ID"
# }



# locals {
#     credentials_id  = data.aws_cloudformation_export.this.value
#     storage_configuration_id  = data.aws_cloudformation_export.this1.value
# }

# data "databricks_mws_credentials" "this" {}


data "aws_cloudformation_stack" "this" {
  name = "databricks-workspace-stack-eb289"
}



data "aws_vpc" "this" {
    tags = {
    name = "databricks-WorkerEnvId(workerenv-4871281226906886-d3abd75f-c4a9-465c-8abf-1dca4739c480)"
    }
}

resource "databricks_mws_workspaces" "this" {
  provider       = databricks.mws
  account_id     = var.databricks_account_id
  aws_region     = var.region
  workspace_name = var.workspace_name
  credentials_id           = data.aws_cloudformation_stack.this.outputs["CredentialsId"]
  storage_configuration_id = data.aws_cloudformation_stack.this.outputs["StorageConfigId"]
  network_id               = data.aws_vpc.this.id

  token {
    comment = "Terraform"
  }
}