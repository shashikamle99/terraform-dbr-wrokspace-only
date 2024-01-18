output "mws_network_id" {
  value = databricks_mws_networks.this.network_id
}

output "mws_credential_id" {
  value = databricks_mws_credentials.this.credentials_id
}  


output "mws_storage_configuration_id" {
  value = data.aws_cloudformation_stack.this.outputs["StorageConfigId"]
}  
