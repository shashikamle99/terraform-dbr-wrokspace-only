
resource "databricks_mws_networks" "this" {
  provider           = databricks.mws
  account_id         = local.databricks_account_id
  network_name       = var.mws_network_name
  security_group_ids = data.aws_security_groups.this.ids
  subnet_ids         = data.aws_subnets.this.ids
  vpc_id             = data.aws_vpc.this.id
}