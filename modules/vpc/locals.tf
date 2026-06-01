locals {
    common_tags = {
        Environment = var.vpc_mappings.environment
        Name = var.vpc_mappings.name
        Team = var.vpc_mappings.team
    }

    internet_gateway_tags = merge(local.common_tags, {
        Name = "${var.vpc_mappings.name_prefix}-igw"
    })

    azs = slice(data.aws_availability_zones.available.names, 0, var.vpc_mappings.az_count)
}