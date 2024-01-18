
resource "databricks_mws_networks" "dbr_mws_networks" {
  provider           = databricks.mws
  account_id         = local.databricks_account_id
  network_name       = var.mws_network_name
  security_group_ids = data.aws_security_groups.dbr_sg.ids
  subnet_ids         = data.aws_subnets.dbr_subnets.ids
  vpc_id             = data.aws_vpc.dbr_vpc.id
}