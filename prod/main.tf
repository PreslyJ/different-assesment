provider "aws" {
  region     = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module "eks" {
 source = "../module/services/eks"
 eks_cluster_name = "${var.eks_cluster_name}"
 region ="${var.region}"
 node_groups ="${var.node_groups}" 
}