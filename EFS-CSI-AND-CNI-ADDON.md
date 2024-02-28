# EFS Driver
1. Create a iam role with cluster oidc with `AmazonEFSCSIDriverPolicy` policy
 - use kube-system namespace and `efs-*` as service account
2. Create a iam role with cluster oidc with `AmazonEFSCSIDriverPolicy` policy
 - use kube-system namespace and `aws-node` as service account

