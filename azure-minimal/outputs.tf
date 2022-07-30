# Resource Group
output "resource-group-name" {
  value = azurerm_resource_group.rg.name
}

# output for the AKS cluster
output "aks-cluster-name" {
  value = module.aks.cluster_name
}

# output for the Blob Storage Container
output "blobstorage-container-path" {
  value       = "az://${azurerm_storage_container.artifact-store.name}"
  description = "The Azure Blob Storage Container path for storing your artifacts"
}
output "storage-account-key" {
  value     = data.azurerm_storage_account.zenml-account.primary_access_key
  sensitive = true
}

# outputs for the Flexible MySQL metadata store
output "metadata-db-host" {
  value = "${azurerm_mysql_flexible_server.mysql.name}.mysql.database.azure.com"
}
output "metadata-db-username" {
  value     = var.metadata-db-username
  sensitive = true
}
output "metadata-db-password" {
  description = "The auto generated default user password if not input password was provided"
  value       = azurerm_mysql_flexible_server.mysql.administrator_password
  sensitive   = true
}

# output for container registry
output "container-registry-URL" {
  value = azurerm_container_registry.container_registry.login_server
}

# outputs for the MLflow tracking server
output "ingress-controller-name" {
  value = module.mlflow.ingress-controller-name
}
output "ingress-controller-namespace" {
  value = module.mlflow.ingress-controller-namespace
}
output "mlflow-tracking-URL" {
  value = data.kubernetes_service.mlflow_tracking.status.0.load_balancer.0.ingress.0.ip
}

# output for seldon model deployer
output "seldon-core-workload-namespace" {
  value       = kubernetes_namespace.seldon-workloads.metadata[0].name
  description = "The namespace created for hosting your Seldon workloads"
}
output "seldon-prediction-spec" {
  value     = module.seldon.ingress-gateway-spec
  sensitive = true
}
output "seldon-base-url" {
  value = data.kubernetes_service.seldon_ingress.status.0.load_balancer.0.ingress.0.ip
}
  