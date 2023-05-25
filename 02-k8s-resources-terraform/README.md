## AWS EKS Cluster ((using Terraform state datasource -local))



In our previous demo `01-terraform-eks-cluster` we have created a eks cluster along with network resources like vpc , subnets etc.  Now by using the state file of those resources we will create kubernetes resources like deployments and services in this demo. Meaning we have already a eks cluster running which we created using terraform in our previous demo and now to create resources in that eks cluster we need name of the cluster , ca certificate to interact or run `kubectl` commands in that cluster and by using terraform remote state datasource we will get the name , token and ca certificate from state file and then use these values in `kubernetes`provider so that we can authenticate and run commands in that cluster..

## What is  Terraform Remote State Datasource

In simple terms, the Terraform remote state data source is a feature in Terraform that allows you to retrieve and use the state data from a previously executed Terraform deployment wheather the state file is stored locally or remotely but we are using the state file stored locally in this demo.

## Terraform files explained 

01-remote-state-datasource.tf: `to  get the state file of previous demo - 01-terraform-eks-cluster we are using this resource`

02-kubernetes-deployment.tf: `a simple deployment file to  deploy 2 pods `

03-kubernetes-load-balancer-svc.tf: `a simple LB type service which will create a classic load balancer to route traffic to pods`

04-providers.tf: ``terraform settings block and aws providers and also  using kubernetes provider. This provider will allow us to run kubectl commands or to  interract with the API server of our eks cluster. For the authentication to eks cluster we are using host name , ca certificate and token in kubernetes provider.``