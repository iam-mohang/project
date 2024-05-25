module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "18.30.0"  # Specify the appropriate version here
  cluster_name    = "mohan-pro"
  cluster_version = "1.26"
  subnets         = [aws_subnet.private[0].id, aws_subnet.private[1].id]
  vpc_id          = aws_vpc.main.id
}

module "eks_node_group" {
  source = "terraform-aws-modules/eks-node-group/aws"
  version = "5.0.0"  # Specify the appropriate version here

  cluster_name    = module.eks.cluster_id
  cluster_version = "1.26"
  node_group_name = "eks-nodes"
  node_group = {
    desired_capacity = 2
    max_capacity     = 3
    min_capacity     = 1

    instance_type = "t3.medium"
  }
  subnets = [aws_subnet.private[0].id, aws_subnet.private[1].id]
}
