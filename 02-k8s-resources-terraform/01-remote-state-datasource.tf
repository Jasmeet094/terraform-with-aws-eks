# By  using this resource we will get the details from  our previous 
#  project to use in this project


data "terraform_remote_state" "eks" {
  backend = "local"

  config = {
    path = "../01-terraform-eks-cluster/terraform.tfstate"
  }
}
