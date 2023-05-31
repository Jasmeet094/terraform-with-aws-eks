# Input Variables - Placeholder file
# AWS Region
variable "region" {
  description = "Region in which AWS Resources to be created"
  type = string
  default = "us-west-2"  
}
# Environment Variable
variable "environment" {
  description = "Environment Variable used as a prefix"
  type = string
  default = "dev-test"
}
# Team 
variable "team" {
  
  type = string
  default = "devops"
}