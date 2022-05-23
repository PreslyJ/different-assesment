variable "region" {
  description = "AWS REGION"
  default     = "us-east-1"
}

variable "aws_access_key" {
  description = "AWS_ACCESS_KEY"
  default     = "AKIAXHBJFOEFB3WZG6EJ"
}

variable "aws_secret_key" {
  description = "AWS_SECRET_KEY"
  default     = "bhz/0jJFy1BlS+6NQEFS7ycocwz4r3wGu7zvnTvK"
}

variable "eks_cluster_name" {
  default     = "prod-cluster"
  description = "name of cluster"
}


variable "node_groups" {
  default = [
    {
      name                 = "nodegroup-1"
      instance_type        = "t3.medium"
      asg_desired_capacity = 3
      max_size             = 6
      key_name             = "techcore1"
      min_size             = 1
    },
    {
      name                 = "nodegroup-2"
      instance_type        = "t3.small"
      asg_desired_capacity = 3
      max_size             = 6
      key_name             = "techcore2"
      min_size             = 1
    }
  ]
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

variable "name" {
  default     = "prod"
  description = "name of cluster/repository"
}
