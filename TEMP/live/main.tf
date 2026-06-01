module "hotstar_vpc" {
    source = "modules/vpc"
    vpc_mappings = var.vpc_mappings
}