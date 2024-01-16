data "aws_cloudformation_stack" "this" {
  name = "databricks-workspace-stack-bfe39"
}

data "aws_vpc" "this" {
  tags = {
    Name = "databricks-WorkerEnvId(workerenv-8281225760377684-ed84b6cf-a205-4105-85b5-5131781c9e96)"
  }
}



resource "databricks_mws_workspaces" "this" {
  provider       = databricks.mws
  account_id     = local.databricks_account_id
  aws_region     = var.region
  workspace_name = var.workspace_name
  credentials_id           = data.aws_cloudformation_stack.this.outputs["CredentialsId"]
  storage_configuration_id = data.aws_cloudformation_stack.this.outputs["StorageConfigId"]
  network_id               = data.aws_vpc.this.id

  token {
    comment = "Terraform"
  }
}