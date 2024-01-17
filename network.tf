
data "aws_vpc" "this" {
   tags = {
    Name = "databricks-WorkerEnvId(workerenv-811664583122875-168c7d50-fd8c-4bd9-a2ea-d88cd9772963)"
  }
}

data "aws_subnets" "this" {
  filter {
    name   = data.aws_vpc.this.id
     values = [var.vpc_id]
  }
}


resource "databricks_mws_networks" "this" {
  provider           = databricks.mws
  account_id         = local.databricks_account_id
  network_name       = "dev-network"
#   security_group_ids = [module.vpc.default_security_group_id]
  subnet_id         = "subnet-035d5ea14e5c31627"
  vpc_id             = data.aws_vpc.this.id
}