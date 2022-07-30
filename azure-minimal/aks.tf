data "azuread_group" "aks_cluster_admins" {
  display_name = "AKS-cluster-admins"
}

module "aks" {
  source                           = "Azure/aks/azurerm"
  resource_group_name              = azurerm_resource_group.rg.name
  kubernetes_version               = local.aks.cluster_version
  orchestrator_version             = local.aks.orchestrator_version
  cluster_name                     = "${local.prefix}-${local.aks.cluster_name}"
  network_plugin                   = "azure"
  vnet_subnet_id                   = module.network.vnet_subnets[0]
  os_disk_size_gb                  = 50
  sku_tier                         = "Free"
  enable_role_based_access_control = true

  enable_http_application_routing = true
  enable_azure_policy             = true
  enable_auto_scaling             = true
  enable_host_encryption          = true
  agents_min_count                = 1
  agents_max_count                = 2
  agents_count                    = null # Please set `agents_count` `null` while `enable_auto_scaling` is `true` to avoid possible `agents_count` changes.
  agents_max_pods                 = 100
  agents_pool_name                = "zenml-nodepool"
  agents_availability_zones       = ["1", "2"]
  agents_type                     = "VirtualMachineScaleSets"

  agents_labels = {
    "nodepool" : "defaultnodepool"
    "managed_by" : "terraform"
  }

  agents_tags = {
    "Agent" : "defaultnodepoolagent"
  }

  enable_ingress_application_gateway      = true
  ingress_application_gateway_name        = "aks-agw"
  ingress_application_gateway_subnet_cidr = "10.52.1.0/24"

  network_policy                 = "azure"
  net_profile_dns_service_ip     = "10.0.0.10"
  net_profile_docker_bridge_cidr = "170.10.0.1/16"
  net_profile_service_cidr       = "10.0.0.0/16"

  depends_on = [module.network]
}

data "azurerm_kubernetes_cluster" "cluster" {
  name                = module.aks.cluster_name
  resource_group_name = azurerm_resource_group.rg.name
  depends_on = [
    module.aks
  ]
}