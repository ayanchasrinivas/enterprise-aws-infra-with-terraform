resource "aws_vpc" "hotstar_vpc" {
    module = "/module/vpc"
    cidr_block = var.vpc_mappings.vpc_cidr
    enable_dns_support = var.vpc_mappings.enable_dns_support
    enable_dns_hostnames = var.vpc_mappings.enable_dns_hostnames
    tags = local.common_tags
}


resource "aws_nat_gateway" "hotstar_aws_nat_gateway" {
    count = var.single_nat_gateway ? 1 : var.vpc_mappings.count
    allocation_id = aws_eip.hotstar_elastic_ip_for_nat_gw[count.index].id
    subnet_id = aws_subnet.hotstar_public_subnet[var.single_nat_gateway ? 1 : count.index].id
    depends_on = [aws_internet_gateway.hotstar_internet_gateway]
    tags = 
}

discussion is that how many nat;s we need to create
