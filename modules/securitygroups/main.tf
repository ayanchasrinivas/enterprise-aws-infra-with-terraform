resource "aws_security_group" "hotstar_alb_sg" {
    name = "${var.security_group_mappings.name_prefix}-ALB-SG"
    description = "hotstar_alb_sg"
    vpc_id = var.security_group_vpc_id
    tags = {
        Name = "${var.security_group_mappings.name_prefix}-ALB-SG"
    }
}

resource "aws_vpc_security_group_ingress_rule" "hotstar_alb_sg_rules" {
    for_each = local.alb_ingress_rules
    security_group_id = aws_security_group.hotstar_alb_sg.id
    cidr_ipv4 = "0.0.0.0/0"
    from_port = each.value.port
    to_port = each.value.port
    ip_protocol = "tcp" 
    description = each.key
    tags = {
        Name = each.key
    }
}

resource "aws_vpc_security_group_egress_rule" "hotstar_alb_sg_egress_rules" {
    security_group_id = aws_security_group.hotstar_alb_sg.id
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol = "-1"
    description = "ACCEPT ALL"
}

resource "aws_security_group" "hotstar_app_sg" {
    name = "${var.security_group_mappings.name_prefix}-APP-SG"
    description = "hotstar_app_sg"
    vpc_id = var.security_group_vpc_id
    tags = {
        Name = "${var.security_group_mappings.name_prefix}-APP-SG"
    }
}

resource "aws_vpc_security_group_ingress_rule" "hotstar_app_sg_rules" {
    for_each = local.alb_ingress_rules
    security_group_id = aws_security_group.hotstar_app_sg.id
    cidr_ipv4 = "0.0.0.0/0"
    from_port = each.value.port
    to_port = each.value.port
    ip_protocol = "tcp"
    description = each.key
    tags = {
        Name = each.key
    }
}

resource "aws_vpc_security_group_egress_rule" "hotstar_app_sg_egress_rules" {
    security_group_id = aws_security_group.hotstar_app_sg.id
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol = "-1"
    description = "ACCEPT ALL"
}

resource "aws_security_group" "hotstar_database_sg" {
    name = "${var.security_group_mappings.name_prefix}-DB-SG"
    description = "hotstar_database_sg"
    vpc_id = var.security_group_vpc_id
    tags = {
        Name = "${var.security_group_mappings.name_prefix}-DB-SG"
    }
}

resource "aws_vpc_security_group_ingress_rule" "hotstar_database_sg_rules" {
    for_each = local.alb_ingress_rules
    security_group_id = aws_security_group.hotstar_database_sg.id
    cidr_ipv4 = "0.0.0.0/0"
    from_port = each.value.port
    to_port = each.value.port
    ip_protocol = "tcp"
    description = each.key
    tags = {
        Name = each.key
    }
}

resource "aws_vpc_security_group_egress_rule" "hotstar_database_sg_egress_rules" {
    security_group_id = aws_security_group.hotstar_database_sg.id
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol = "-1"
    description = "ACCEPT ALL"
}

resource "aws_security_group" "hotstar_documentdb_sg" {
    name = "${var.security_group_mappings.name_prefix}-DOCDB-SG"
    description = "hotstar_documentdb_sg"
    vpc_id = var.security_group_vpc_id
    tags = {
        Name = "${var.security_group_mappings.name_prefix}-DOCDB-SG"
    }
}

resource "aws_vpc_security_group_ingress_rule" "hotstar_documentdb_sg_rules" {
    for_each = local.alb_ingress_rules
    security_group_id = aws_security_group.hotstar_documentdb_sg.id
    cidr_ipv4 = "0.0.0.0/0"
    from_port = each.value.port
    to_port = each.value.port
    ip_protocol = "tcp"
    description = each.key
    tags = {
        Name = each.key
    }
}

resource "aws_vpc_security_group_egress_rule" "hotstar_documentdb_sg_egress_rules" {
    security_group_id = aws_security_group.hotstar_documentdb_sg.id
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol = "-1"
    description = "ACCEPT ALL"
}

resource "aws_security_group" "hotstar_redis_sg" {
    name = "${var.security_group_mappings.name_prefix}-REDIS-SG"
    description = "hotstar_redis_sg"
    vpc_id = var.security_group_vpc_id
    tags = {
        Name = "${var.security_group_mappings.name_prefix}-REDIS-SG"
    }
}

resource "aws_vpc_security_group_ingress_rule" "hotstar_redis_sg_rules" {
    for_each = local.alb_ingress_rules
    security_group_id = aws_security_group.hotstar_redis_sg.id
    cidr_ipv4 = "0.0.0.0/0"
    from_port = each.value.port
    to_port = each.value.port
    ip_protocol = "tcp"
    description = each.key
    tags = {
        Name = each.key
    }
}

resource "aws_vpc_security_group_egress_rule" "hotstar_redis_sg_egress_rules" {
    security_group_id = aws_security_group.hotstar_redis_sg.id
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol = "-1"
    description = "ACCEPT ALL"
}

resource "aws_security_group" "hotstar_efs_sg" {
    name = "${var.security_group_mappings.name_prefix}-EFS-SG"
    description = "hotstar_efs_sg"
    vpc_id = var.security_group_vpc_id
    tags = {
        Name = "${var.security_group_mappings.name_prefix}-EFS-SG"
    }
}

resource "aws_vpc_security_group_ingress_rule" "hotstar_efs_sg_rules" {
    for_each = local.alb_ingress_rules
    security_group_id = aws_security_group.hotstar_efs_sg.id
    cidr_ipv4 = "0.0.0.0/0"
    from_port = each.value.port
    to_port = each.value.port
    ip_protocol = "tcp"
    description = each.key
    tags = {
        Name = each.key
    }
}

resource "aws_vpc_security_group_egress_rule" "hotstar_efs_sg_egress_rules" {
    security_group_id = aws_security_group.hotstar_efs_sg.id
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol = "-1"
    description = "ACCEPT ALL"
}

resource "aws_security_group" "hotstar_msk_sg" {
    name = "${var.security_group_mappings.name_prefix}-MSK-SG"
    description = "hotstar_msk_sg"
    vpc_id = var.security_group_vpc_id
    tags = {
        Name = "${var.security_group_mappings.name_prefix}-MSK-SG"
    }
}

resource "aws_vpc_security_group_ingress_rule" "hotstar_msk_sg_rules" {
    for_each = local.alb_ingress_rules
    security_group_id = aws_security_group.hotstar_msk_sg.id
    cidr_ipv4 = "0.0.0.0/0"
    from_port = each.value.port
    to_port = each.value.port
    ip_protocol = "tcp"
    description = each.key
    tags = {
        Name = each.key
    }
}

resource "aws_vpc_security_group_egress_rule" "hotstar_msk_sg_egress_rules" {
    security_group_id = aws_security_group.hotstar_msk_sg.id
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol = "-1"
    description = "ACCEPT ALL"
}

resource "aws_security_group" "hotstar_opensearch_sg" {
    name = "${var.security_group_mappings.name_prefix}-OPENSEARCH-SG"
    description = "hotstar_opensearch_sg"
    vpc_id = var.security_group_vpc_id
    tags = {
        Name = "${var.security_group_mappings.name_prefix}-OPENSEARCH-SG"
    }
}

resource "aws_vpc_security_group_ingress_rule" "hotstar_opensearch_sg_rules" {
    for_each = local.alb_ingress_rules
    security_group_id = aws_security_group.hotstar_opensearch_sg.id
    cidr_ipv4 = "0.0.0.0/0"
    from_port = each.value.port
    to_port = each.value.port
    ip_protocol = "tcp"
    description = each.key
    tags = {
        Name = each.key
    }
}

resource "aws_vpc_security_group_egress_rule" "hotstar_opensearch_sg_egress_rules" {
    security_group_id = aws_security_group.hotstar_opensearch_sg.id
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol = "-1"
    description = "ACCEPT ALL"
}