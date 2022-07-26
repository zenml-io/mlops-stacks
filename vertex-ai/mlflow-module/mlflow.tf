# create the mlflow tracking server deployment
resource "helm_release" "mlflow-tracking" {

  name       = "mlflow-tracking"
  repository = "https://community-charts.github.io/helm-charts"
  chart      = "mlflow"

  # set values for S3 artifact store
  set {
    name  = "artifactRoot.s3.enabled"
    value = var.artifact_S3
  }
  set {
    name  = "artifactRoot.s3.bucket"
    value = var.artifact_S3_Bucket
  }
  set {
    name  = "artifactRoot.s3.awsAccessKeyId"
    value = var.artifact_S3_Access_Key
  }
  set {
    name  = "artifactRoot.s3.awsSecretAccessKey"
    value = var.artifact_S3_Secret_Key
  }

  # set values for Azure Blob Storage
  set {
    name  = "artifactRoot.azureBlob.enabled"
    value = var.artifact_Azure
  }
  set {
    name  = "artifactRoot.azureBlob.storageAccount"
    value = var.artifact_Azure_Storage_Account_Name
  }
  set {
    name  = "artifactRoot.azureBlob.container"
    value = var.artifact_Azure_Container
  }
  set {
    name  = "artifactRoot.azureBlob.accessKey"
    value = var.artifact_Azure_Access_Key
  }

  # set values for GCS artifact store
  set {
    name  = "artifactRoot.gcs.enabled"
    value = var.artifact_GCS
  }
  set {
    name  = "artifactRoot.gcs.bucket"
    value = var.artifact_GCS_Bucket
  }
}