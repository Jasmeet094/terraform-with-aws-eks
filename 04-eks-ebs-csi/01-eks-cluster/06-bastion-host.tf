# # bastion host from which we'll ssh to our private servers

# module "ec2_instance" {
#   source  = "terraform-aws-modules/ec2-instance/aws"
#   version = "~> 3.0"

#   name = "${local.name}-bastion-host"

#   ami                    = data.aws_ami.amzn-ami.id
#   instance_type          = var.instance-type
#   key_name               = var.key
#   vpc_security_group_ids = [module.bastion_sg.security_group_id]
#   subnet_id              = element(module.vpc.public_subnets, 0)
#   #user_data              = file("${path.module}/15-user-data-bastion.sh")
#   #associate_public_ip_address = true
#   tags = local.common_tags
# }