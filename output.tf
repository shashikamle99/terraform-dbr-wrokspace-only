output "mws_network_id" {
  value = databricks_mws_networks.dbr_mws_networks.network_id
}

output "mws_credential_id" {
  value = databricks_mws_credentials.dbr_mws_cred.credentials_id
}  


output "mws_storage_configuration_id" {
  value = data.aws_cloudformation_stack.aws_cf_stack.outputs["StorageConfigId"]
}  
