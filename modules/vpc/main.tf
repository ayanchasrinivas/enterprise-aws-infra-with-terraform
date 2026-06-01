resource "aws_vpc" "hotstar_vpc" {
    cidr_block = var.vpc_mappings.vpc_cidr
    enable_dns_support = var.vpc_mappings.enable_dns_support
    enable_dns_hostnames = var.vpc_mappings.enable_dns_hostnames
    tags = local.common_tags
}

resource "aws_internet_gateway" "hotstar_internet_gateway" {
    vpc_id = aws_vpc.hotstar_vpc.id
    tags = local.internet_gateway_tags
}

resource "aws_subnet" "hotstar_public_subnet" {
    count = var.vpc_mappings.az_count
    vpc_id = aws_vpc.hotstar_vpc.id
    availability_zone = local.azs[count.index]
    cidr_block = cidrsubnet(var.vpc_mappings.vpc_cidr, 8, count.index)
    tags = merge(local.common_tags, {
        Name = "${var.vpc_mappings.name_prefix}-public-subnet-${local.azs[count.index]}"
        Type = var.vpc_mappings.public_type
        }
    )
}

resource "aws_subnet" "hotstar_private_subnet" {
    count = var.vpc_mappings.az_count
    vpc_id = aws_vpc.hotstar_vpc.id
    availability_zone = local.azs[count.index]
    cidr_block = cidrsubnet(var.vpc_mappings.vpc_cidr, 8, count.index + 20)
    tags = merge(local.common_tags, {
        Name = "${var.vpc_mappings.name_prefix}-private-subnet-${local.azs[count.index]}"
        Type = var.vpc_mappings.private_type
    })
}

resource "aws_eip" "hotstar_elastic_ip_for_nat_gw" {
    count = var.vpc_mappings.single_nat_gateway ? 1 : var.vpc_mappings.az_count
    domain = "vpc"
    tags = merge(local.common_tags, {
        Name = "${var.vpc_mappings.name_prefix}-hotstar-elatic-ip"
    })
}

resource "aws_nat_gateway" "hotstar_nat_gateway" {
    count = var.vpc_mappings.single_nat_gateway ? 1 : var.vpc_mappings.az_count
    allocation_id = aws_eip.hotstar_elastic_ip_for_nat_gw[count.index].id
    subnet_id = aws_subnet.hotstar_public_subnet[var.vpc_mappings.single_nat_gateway ? 1 : count.index].id
    depends_on = [aws_internet_gateway.hotstar_internet_gateway]
    tags = merge(local.common_tags, {
        Name = "${var.vpc_mappings.name_prefix}-ngw-${count.index + 1}"
    })
}

resource "aws_route_table" "hotstar_public_rt_for_igw" {
    vpc_id = aws_vpc.hotstar_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.hotstar_internet_gateway.id
    }
    tags = merge(local.common_tags, {
        Name = "${var.vpc_mappings.name_prefix}-public-rt"
    })
}

resource "aws_route_table_association" "hotstar_public_rt_association" {
    count = var.vpc_mappings.az_count
    subnet_id = aws_subnet.hotstar_public_subnet[count.index].id
    route_table_id = aws_route_table.hotstar_public_rt_for_igw.id
}

resource "aws_route_table" "hotstar_private_rt_for_igw" {
    count = var.vpc_mappings.az_count
    vpc_id = aws_vpc.hotstar_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.hotstar_nat_gateway[var.vpc_mappings.single_nat_gateway ? 0 : count.index].id
    }
    tags = merge(local.common_tags, {
        Name = "${var.vpc_mappings.name_prefix}-private-rt-${count.index + 1}"
    })
}

resource "aws_route_table_association" "hotstar_private_rt_association" {
    count = var.vpc_mappings.az_count
    subnet_id = aws_subnet.hotstar_private_subnet[count.index].id
    route_table_id = aws_route_table.hotstar_private_rt_for_igw[count.index].id
}