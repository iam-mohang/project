module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "mohan-pro"
  cluster_version = "1.26"
  subnet_ids     = [aws_subnet.private[0].id, aws_subnet.private[1].id]
  vpc_id          = aws_vpc.main.id
  eks_managed_node_groups = {

    node_group = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1

      instance_type = "t3.medium"
    }
  }
}
