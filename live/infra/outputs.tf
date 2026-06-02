output "hotstar_vpc_id" {
  value = module.hotstar_vpc.hotstar_vpc_id
}

output "hotstar_vpc_arn" {
  value = module.hotstar_vpc.hotstar_vpc_arn
}

output "hotstar_vpc_cidr" {
  value = module.hotstar_vpc.hotstar_vpc_cidr_block
}

output "hotstar_vpc_igw_id" {
  value = module.hotstar_vpc.hotstar_vpc_igw_id
}

output "hotstar_vpc_public_subnet_ids" {
  value = module.hotstar_vpc.hotstar_vpc_public_subnet_ids
}

output "hotstar_vpc_private_subnet_ids" {
  value = module.hotstar_vpc.hotstar_vpc_private_subnet_ids
}

output "hotstar_vpc_ngw_id" {
  value = module.hotstar_vpc.hotstar_vpc_ngw_id
}

output "hotstar_alb_sg_id" {
    value = module.securitygroups.hotstar_alb_sg_id
}

output "hotstar_alb_arn" {
    value = module.hotstar_alb.hotstar_alb_arn
}