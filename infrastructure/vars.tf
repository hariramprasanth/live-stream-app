variable "aws_region" {
  description = "The AWS region where resources will be created."
  default     = "ap-south-1"
}

variable "k8_namespace" {
  description = "K8 namespace"
  default     = "kube-system"
}

variable "k8_efs_service_account" {
  description = "K8 Service Account"
  default     = "efs-csi-*"
}

variable "k8_cni_service_account" {
  description = "K8 Service Account"
  default     = "aws-node"
}