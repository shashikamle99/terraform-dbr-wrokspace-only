
data "aws_vpc" "this" {
   tags = {
    Name = "databricks-WorkerEnvId(workerenv-811664583122875-168c7d50-fd8c-4bd9-a2ea-d88cd9772963)"
  }
}



resource "databricks_mws_networks" "this" {
  provider           = databricks.mws
  account_id         = local.databricks_account_id
  network_name       = "dev-network"
#   security_group_ids = [module.vpc.default_security_group_id]
#   subnet_ids         = module.vpc.private_subnets
  vpc_id             = data.aws_vpc.this.id
}