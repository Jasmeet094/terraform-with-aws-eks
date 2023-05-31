# to get the current aws_partition in which terraform configuration is working

data "aws_partition" "current" {}


# Create eks oidc connect provider to access aws resources from worloads running in eks cluster

resource "aws_iam_openid_connect_provider" "eks_oidc_connect" {
  url = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer

  client_id_list = ["sts.${data.aws_partition.current.dns_suffix}"]

  thumbprint_list = [var.eks_oidc_root_ca_thumbprint]

  tags = merge(
    {
      Name = "${var.cluster_name}-eks-irsa"
    },
    local.common_tags
  )
}

# Output: AWS IAM Open ID Connect Provider ARN
output "aws_iam_openid_connect_provider_arn" {
  description = "AWS IAM Open ID Connect Provider ARN"
  value       = aws_iam_openid_connect_provider.eks_oidc_connect.arn
}

# Extract OIDC Provider from OIDC Provider ARN
locals {
  aws_iam_oidc_connect_provider_extract_from_arn = element(split("oidc-provider/", aws_iam_openid_connect_provider.eks_oidc_connect.arn), 1)
}

# Output: AWS IAM Open ID Connect Provider
output "aws_iam_openid_connect_provider_extract_from_arn" {
  description = "AWS IAM Open ID Connect Provider extract from ARN"
  value       = local.aws_iam_oidc_connect_provider_extract_from_arn
}

