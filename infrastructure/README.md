# AWS EKS
This repo contains the terraform script on deploying kubernetes cluster on AWS eks.
prerequisite needed
- AWS account 
- AWS CLI
- terraform CLI
- kubernetes CLI

## Deploy using Terraform
1. terraform init
2. terraform plan
3. terraform apply

## Accessing the kubertes cluster from cli
1. aws eks update-kubeconfig --name web-server-eks --region ap-south-1
