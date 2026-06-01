locals {
    common_tags = {
        Environment = var.vpc_mappings.environment
        Name = var.vpc_mappings.name
        Team = var.vpc_mappings.team
    }
}