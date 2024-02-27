# EFS Driver
1. create a iam role with cluster oidc with `AmazonEFSCSIDriverPolicy` policy
Note: use kubesystem namespace and efs-service account

2. Go to eks console window, click the Addon and efs csi driver.
3. Select the above iam role and submit.
4. use the follwing cmd to verify the installation `kubectl get csidrivers.storage.k8s.io`