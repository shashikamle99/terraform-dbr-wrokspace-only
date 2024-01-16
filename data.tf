data "aws_ssm_parameter" "client_id" {
  name = "client_id"
}

data "aws_ssm_parameter" "client_secret" {
  name = "client_secret"
}

data "aws_ssm_parameter" "dbr_account_id" {
  name = "databricks_account_id"
}


locals {
    client_id = data.aws_ssm_parameter.client_id.value
    client_secret = data.aws_ssm_parameter.client_secret.value
    databricks_account_id = data.aws_ssm_parameter.dbr_account_id.value
}