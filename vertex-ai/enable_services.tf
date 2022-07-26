data "google_project" "project" {
  project_id = local.project_id
}

# enable vertex ai
resource "google_project_service" "vertex_ai" {
  project = local.project_id
  service = "aiplatform.googleapis.com"
}

# enable secret manager
resource "google_project_service" "secret_manager" {
  project = local.project_id
  service = "secretmanager.googleapis.com"
}

# enable container registry
resource "google_project_service" "container_registry" {
  project = local.project_id
  service = "containerregistry.googleapis.com"
}

# enable cloud resource manager API
resource "google_project_service" "cloud_resource_manager_api" {
  project = local.project_id
  service = "cloudresourcemanager.googleapis.com"
}

# enable container API
resource "google_project_service" "container_api" {
  project = local.project_id
  service = "container.googleapis.com"
}

# enable compute engine API
resource "google_project_service" "compute_engine_api" {
  project = local.project_id
  service = "compute.googleapis.com"
}

# resource "null_resource" "enable-artifactregistry" {
#   provisioner "local-exec" {
#     command = "gcloud services enable artifactregistry.googleapis.com --project=${local.project_id}"
#   }
# }

