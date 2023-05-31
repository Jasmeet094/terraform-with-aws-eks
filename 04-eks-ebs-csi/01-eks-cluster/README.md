## AWS EKS with Terraform { IRSA - IAM Roles for Service Accounts}



## Terraform file Explaination 


01-vpc.tf : `This tf file will create a vpc along with 2 public and private subnets.`

02-vpc-vars.tf: `variables used for vpc`

03-vpc.auto.tfvars: `you can change values as per your requirements`

04-vpc-outputs.tf: `outputs related to vpc resources`

05-bastion-sg.tf: `security group related to bastion host having ssh port open to world`

06-bastion-host.tf: `a normal ec2 instances act as bastion host which we can use to ssh into  private instances`

07-ec2-outputs.tf: `outputs related to ec2 instances`

08-ec2-vars.tf:  `variables used for  instances`

09-data-ami.tf: `to get the latest AMI from aws`

10-remote-exec.tf: `using null resources to create a connnection to  our bastion host and then copy the pem key file to bastion host`

11-IAM-role-eks-cluster.tf: `IAM role for EKS cluster and also IAM policy attachment resource to attach policy to  the IAM role`

12-IAM-role-eks-nodegroup.tf: `IAM role for EKS cluster's nodegroups and also IAM policy attachment resource to attach policy to  the IAM role`

13-eks-cluster.tf: `EKS cluster hsving public access enabled endpoint`

14-eks-vars.tf: `varibales related to eks cluster`

15-eks.auto.tfvars: `we can change the values of variables used for  eks cluster as per requirements`

16-eks-outputs.tf: `outputs related to eks cluster`

17-eks-nodegroup-public.tf: `Public nodegroup with 2 nodes`

18-eks-nodegroup-private.tf: `Private nodegroup with 2 nodes`

19-iam-oidc-eks.tf: `this file  will  create eks cluster as oidc connect provider.`

20-oidc-vars.tf: `using thumprint of eks service as a varibale`

generic-vars.tf: `variables used for region and env`

locals.tf: `commonly  used tags used as locals`

private_key: `pemkey for ec2 instances`

providers.tf: `terraform settings block and aws providers`

