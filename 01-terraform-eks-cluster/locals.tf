locals {
  name = "${var.env}-dev"
  common_tags = {
    Terraform   = "True"
    environment = "testing"
    Team        = "Devops"
  }
  eks_cluster_name = "${local.name}-${var.cluster_name}"
}
