module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.8.4"
  cluster_name    = "mohan-pro"
  cluster_version = "1.26"
  subnet_ids      = [aws_subnet.private[0].id, aws_subnet.private[1].id]
  vpc_id          = aws_vpc.main.id

  eks_managed_node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 4
      min_capacity     = 2

      instance_type = "t3.medium"
    }
  }
}
