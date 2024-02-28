resource "aws_iam_role" "web_server_efs_csi_addon_role" {
  name = "web-server-efs-csi-addon-role"

  assume_role_policy = templatefile("AssumeRolePolicy.json", {
    OIDC_ARN        = aws_iam_openid_connect_provider.web_server_cluster_identity_provider.arn,
    OIDC_ID         = replace(aws_eks_cluster.web_server_eks.identity.0.oidc.0.issuer, "https://", "")
    NAMESPACE       = var.k8_namespace,
    SERVICE_ACCOUNT = var.k8_efs_service_account
  })
}

resource "aws_iam_role_policy_attachment" "eks_AmazonEFSCSIDriverPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEFSCSIDriverPolicy"
  role       = aws_iam_role.web_server_efs_csi_addon_role.name
}