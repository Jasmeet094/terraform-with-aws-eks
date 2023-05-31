# By  using this resource we will get the details from  our previous 
#  project to use in this project


data "terraform_remote_state" "eks" {
  backend = "s3"

  config = {
    bucket = "jasmeet-test-terraform"
    key    = "dev/terraform.tfstate"
    region = "us-west-2"
  }
}
