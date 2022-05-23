module "eks" {
  source           = "terraform-aws-modules/eks/aws"
  cluster_name     = local.cluster_name
  subnets          = module.vpc.private_subnets
  cluster_version  = var.cluster_k8s_version
  enable_irsa      = true
  write_kubeconfig = false
  version          = "17.24.0"

  tags = {
    Environment = "${local.cluster_name}"
  }

  vpc_id = module.vpc.vpc_id

  worker_groups = flatten([
    for worker_group in var.node_groups : [
      {
        name                          = worker_group["name"]
        instance_type                 = worker_group["instance_type"]
        asg_desired_capacity          = worker_group["min_size"]
        asg_max_size                  = worker_group["max_size"]
        asg_min_size                  = worker_group["min_size"]
        additional_security_group_ids = [aws_security_group.worker_group_mgmt_two.id]
      }
    ]
  ])

  worker_additional_security_group_ids = [aws_security_group.all_worker_mgmt.id]
}