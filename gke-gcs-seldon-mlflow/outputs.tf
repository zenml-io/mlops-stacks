# output "seldon-core-workload-namespace" {
#   value = kubernetes_namespace.seldon-workloads.metadata[0].name
#   description = "The namespace created for hosting your Seldon workloads"
# }

# output "seldon-prediction-spec" {
#   value = module.seldon.ingress-gateway-spec
#   sensitive = true
# }


# output "s3-bucket-path" {
#   value = aws_s3_bucket.zenml-artifact-store.bucket
#   description = "The S3 bucket path for storing your artifacts"
# }

# output "ecr-registry-name" {
#   value = aws_ecr_repository.zenml-ecr-registry[0].name
#   description = "The ECR registry name for storing your images"
# }

# output "eks-cluster-name" {
#   value = data.aws_eks_cluster.cluster.name
# }

# output "ingress-controller-name" {
#   value = module.mlflow.ingress-controller-name
# }
# output "ingress-controller-namespace" {
#   value = module.mlflow.ingress-controller-namespace
# }
  