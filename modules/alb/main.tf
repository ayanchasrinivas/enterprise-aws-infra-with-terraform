resource "aws_alb" "hotstar_aws_alb" {
    name = substr("${var.alb_mappings.name_prefix}-alb", 0, 32)
    internal = false
    load_balancer_type = "application"
    security_groups = [var.security_group_id]
    subnets = var.subnet_ids
    idle_timeout = 60
    enable_deletion_protection = true
    drop_invalid_header_fields = true
    depends_on = [aws_internet_gateway.hotstar_internet_gateway]
}

resource "aws_lb_target_group" "hotstar_alb_tg_1" {
    name = substr("${var.alb_mappings.name_prefix}-alb-tg-1", 0, 32)
    port = 8080
    protocol = "HTTP"
    vpc_id = var.alb_vpc_id
    target_type = "instance"
    health_check {
        enabled = true
        interval = 30
        path = "/var/www-health"
        matcher = "200-399"
        healthy_threshold = 2
        unhealthy_threshold =3
    }
}

resource "aws_lb_target_group" "hotstar_alb_tg_2" {
    name = substr("${var.alb_mappings.name_prefix}-alb-tg-2", 0, 32)
    port = 8081
    protocol = "HTTP"
    vpc_id = var.alb_vpc_id
    target_type = "instance"
    health_check {
        enabled = true
        interval = 30
        path = "/var/www-health/health"
        matcher = "200-399"
        healthy_threshold = 2
        unhealthy_threshold = 3
    }
}