// data source aws parameters

data "aws_ssm_parameter" "client_id" {
  name = "client_id"
}

data "aws_ssm_parameter" "client_secret" {
  name = "client_secret"
}

data "aws_ssm_parameter" "dbr_account_id" {
  name = "databricks_account_id"
}



// data source aws cloudformation stack

data "aws_cloudformation_stack" "aws_cf_stack" {
  name = var.stack_name
}


// data source aws VPC

# data "aws_vpc" "dbr_vpc" {
#    tags = {
#     Name = "databricks-WorkerEnvId(workerenv-643699630685625-4c80966a-2695-4f2d-a334-2fdac0748944)"
#   }
# }


data "aws_vpc" "dbr_vpc" {
  id = var.vpc_id
}



// data source aws private subnets

data "aws_subnets" "dbr_subnets" {
  filter {
    name   = "tag:Name"
    values = ["dev-dbr-private-subnet"] 
  }
}



// data source aws security_groups

data "aws_security_groups" "dbr_sg" {
  tags = {
    Name = "dev-dbr-worker-sg"
    
  }
}



// declear local variables

locals {
    client_id = data.aws_ssm_parameter.client_id.value
    client_secret = data.aws_ssm_parameter.client_secret.value
    databricks_account_id = data.aws_ssm_parameter.dbr_account_id.value
}