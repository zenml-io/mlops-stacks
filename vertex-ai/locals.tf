# config values to use across the module
locals {
  prefix     = "demo"
  region     = "europe-west3"
  project_id = "zenml-demos"

  vertex_ai = {
    region = "europe-west3" # the location to run your Vertex AI pipelines in
  }
  gcs = {
    name     = "zenml-artifact-store"
    location = "US-WEST1"
  }

  cloudsql = {
    name = "zenml-metadata-store-demo"
    authorized_networks = [
      {
        name  = "all",
        value = "0.0.0.0/0"
      }
    ]
    require_ssl = true
  }

  service_account = {
    account_id = "zenml-vertex-sa"
  }

  container_registry = {
    region = "eu" # available options: eu, us, asia
  }

  # skip this if you're using the container registry
  artifact_repository = {
    name                      = "zenml-kubernetes"
    enable_container_registry = false
  }

  enable_mlflow = true
  gke = {
    cluster_name = "zenml-terraform-cluster"
    # important to use 1.22 or above due to a bug with Istio in older versions
    cluster_version      = "1.22"
    service_account_name = "zenml"
  }
  vpc = {
    name = "zenml-vpc"
  }

  mlflow = {
    artifact_GCS = "true"
    # if not set, the bucket created as part of the deployment will be used
    artifact_GCS_Bucket = ""
  }

  tags = {
    "managedBy"   = "terraform"
    "application" = local.prefix
  }
}