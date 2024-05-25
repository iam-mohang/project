module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "mohan-pro"
  cluster_version = "1.26"
  subnet_ids     = [aws_subnet.private[0].id, aws_subnet.private[1].id]
  vpc_id          = aws_vpc.main.id
  eks_managed_node_group_defaults = {
    ami_type               = "AL2_x86_64"
    instance_types         = ["t3.medium"]
  }

  eks_managed_node_groups = {

    node_group = {
      min_size     = 1
      max_size     = 3
      desired_size = 2
    }
  }
}
