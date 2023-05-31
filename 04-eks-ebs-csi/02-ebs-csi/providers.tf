# Terraform settings block 

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.67"
    }

    helm = {
      source = "hashicorp/helm"
      version = " ~> 2.9"
    }

    http = {
      source = "hashicorp/http"
      version = "~> 3.3"
    }

  }
}

provider "aws" {
  region = "us-west-2"
}

provider "helm" {
  # Configuration options
}

provider "http" {
  # Configuration options
}


# Using data resource here to get the name of the EKS Cluster
data "aws_eks_cluster" "cluster" {
  name = data.terraform_remote_state.eks.outputs.cluster_id

}

# Get an authentication token to communicate with an EKS cluster
data "aws_eks_cluster_auth" "cluster" {
  name = data.terraform_remote_state.eks.outputs.cluster_id
}


# HELM Provider
provider "helm" {
  kubernetes {
    host                   = data.terraform_remote_state.eks.outputs.cluster_endpoint
    cluster_ca_certificate = base64decode(data.terraform_remote_state.eks.outputs.cluster_certificate_authority_data)
    token                  = data.aws_eks_cluster_auth.cluster.token
  }
}

