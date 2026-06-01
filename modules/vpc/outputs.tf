output "hotstar_vpc_id" {
    value = aws_vpc.hotstar_vpc.id
}

output "hotstar_vpc_arn" {
    value = aws_vpc.hotstar_vpc.arn
}

output "hotstar_vpc_cidr_block" {
    value = aws_vpc.hotstar_vpc.cidr_block
}

output "hotstar_vpc_igw_id" {
    value = aws_internet_gateway.hotstar_internet_gateway.id
}

output "hotstar_vpc_public_subnet_ids" {
    value = aws_subnet.hotstar_public_subnet[*].id
}

output "hotstar_vpc_private_subnet_ids" {
    value = aws_subnet.hotstar_private_subnet[*].id
}

output "hotstar_vpc_ngw_id" {
    value = aws_nat_gateway.hotstar_nat_gateway[*].id
}