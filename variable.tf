# variable "client_id" {}
# variable "client_secret" {}
# variable "databricks_account_id" {}

variable "workspace_name" {}


variable "region" {
  default = "us-west-1"
}



# variable "cidr_block1" {
#   description = "The source CIDR block to allow traffic from"
#   default     = ["10.43.1.0/24","10.43.2.0/24"]
#   type        = string
# }



# variable "public_subnets" {}

# variable "private_subnets" {}

variable "cidr_block" {  
  default = "10.43.0.0/16"
}