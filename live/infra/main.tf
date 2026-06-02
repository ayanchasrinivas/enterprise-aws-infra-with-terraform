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

module "hotstar_iam" {
  source = "../../modules/iam"
  iam_mappings = var.iam_mappings
  iam_devops_users = var.iam_devops_users
}

module "hotstar_lightsail" {
  source = "../../modules/lightsail"
  lightsail_mappings = var.lightsail_mappings
}

module "hotstar_ecr" {
  source = "../../modules/ecr"
  ecr_mappings = var.ecr_mappings
  hotstar_ecr_repositories = var.hotstar_ecr_repositories
}

module "hotstar_efs" {
  source = "../../modules/efs"
  efs_mappings = var.efs_mappings
  subnet_ids = module.hotstar_vpc.hotstar_vpc_public_subnet_ids
  security_group_id = module.hotstar_security_groups.hotstar_alb_sg_id
}

module "hotstar_alb" {
  source = "../../modules/alb"
  alb_mappings = var.alb_mappings
  subnet_ids = module.hotstar_vpc.hotstar_vpc_public_subnet_ids
  security_group_id = module.hotstar_security_groups.hotstar_alb_sg_id
  alb_vpc_id =  module.hotstar_vpc.hotstar_vpc_id
}

module "hotstar_waf" {
  source = "../../modules/waf-v2"
  waf_mappings = var.waf_mappings
  alb_arn = module.hotstar_alb.hotstar_alb_arn
}
    