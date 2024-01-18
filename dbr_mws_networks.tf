
data "aws_vpc" "this" {
   tags = {
    Name = "databricks-WorkerEnvId(workerenv-643699630685625-4c80966a-2695-4f2d-a334-2fdac0748944)"
  }
}


data "aws_subnets" "this" {
  filter {
    name   = "tag:Name"
    values = ["dev-dbr-private-subnet"] 
  }
}




data "aws_security_groups" "this" {
  tags = {
    Name = "dev-dbr-worker-sg"
    
  }
}


resource "databricks_mws_networks" "this" {
  provider           = databricks.mws
  account_id         = local.databricks_account_id
  network_name       = var.mws_network_name
  security_group_ids = data.aws_security_groups.this.ids
  subnet_ids         = data.aws_subnets.this.ids
  vpc_id             = data.aws_vpc.this.id
}