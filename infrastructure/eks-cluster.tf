resource "aws_eks_cluster" "web_server_eks" {
  name     = "web-server-eks"
  role_arn = aws_iam_role.web_server_cluster_role.arn

  vpc_config {
    endpoint_public_access = true

    subnet_ids = [
      aws_subnet.web_server_subnet_1.id,
      aws_subnet.web_server_subnet_2.id,
      aws_subnet.web_server_subnet_3.id,
      aws_subnet.web_server_subnet_4.id

    ]
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_AmazonEKSClusterPolicy
  ]
}

resource "aws_iam_role" "web_server_cluster_role" {
  name = "web-server-cluster-role"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "eks.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "eks_AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.web_server_cluster_role.name
}


resource "aws_eks_addon" "web_server_eks_cni_addon" {
  cluster_name = aws_eks_cluster.web_server_eks.name
  addon_name   = "vpc-cni"
  addon_version = "v1.16.2-eksbuild.1"
  service_account_role_arn = aws_iam_role.eks_cni_addon_role.arn
}

resource "aws_eks_addon" "web_server_efs_addon" {
  cluster_name = aws_eks_cluster.web_server_eks.name
  addon_name   = "aws-efs-csi-driver"
  addon_version = "v1.7.5-eksbuild.2"
  service_account_role_arn = aws_iam_role.web_server_efs_csi_addon_role.arn
}