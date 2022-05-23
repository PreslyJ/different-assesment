variable "region" {
  description = "AWS REGION"
}

variable "eks_cluster_name" {
  description = "name of cluster"
}

variable "cluster_k8s_version" {
  description = "K8S version to use"
  default     = 1.21
}

variable "node_groups" {
  description = "Worker nodes to add to cluster"
  type = list(object({
    name                 = string
    instance_type        = string
    asg_desired_capacity = number
    max_size             = number
    key_name             = string
    min_size             = number
  }))
}

