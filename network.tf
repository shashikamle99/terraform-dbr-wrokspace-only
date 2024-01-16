data "aws_vpc" "this" {
  tags = {
    Name = "databricks-WorkerEnvId(workerenv-8281225760377684-ed84b6cf-a205-4105-85b5-5131781c9e96)"
  }
}

resource "databricks_mws_networks" "this" {
  provider           = databricks.mws
  account_id         = local.databricks_account_id
  network_name       = "dev-network"
  vpc_id             = data.aws_vpc.this.id
}