module "hotstar_vpc" {
  source       = "../../modules/vpc"
  vpc_mappings = var.vpc_mappings
}

module "hotstar_security_groups" {
  source = "../../modules/securitygroups"
  security_group_mappings = var.security_group_mappings
  security_group_vpc_id = module.hotstar_vpc.hotstar_vpc_id
}

module "hotstar_ec2" {
  source = "../../modules/ec2"
  ec2_mappings = var.ec2_mappings
  subnet_ids = module.hotstar_vpc.hotstar_vpc_public_subnet_ids
  security_group_ids = [module.hotstar_security_groups.hotstar_alb_sg_id]
}