resource "aws_lightsail_instance" "hotstar_lightsail_instance" {
    count = var.lightsail_mappings.instance_count
    availability_zone = data.aws_availability_zones.available_azs.names[0]
    name = "${var.lightsail_mappings.name_prefix}-lightsail-${count.index + 1}"
    blueprint_id = var.lightsail_mappings.blueprint_id
    bundle_id = var.lightsail_mappings.bundle_id
    key_pair_name = var.lightsail_mappings.key_pair_name
    tags = {
        Name = "${var.lightsail_mappings.name_prefix}-lightsail-${count.index + 1}"
    }
}

resource "aws_lightsail_instance_public_ports" "hotstar_lightsail_instance_public_ports" {
    count = var.lightsail_mappings.instance_count
    instance_name = aws_lightsail_instance.hotstar_lightsail_instance[0].name
    port_info {
        protocol = "tcp"
        from_port = 80
        to_port = 80
    }
    port_info {
        protocol = "tcp"
        from_port = 443
        to_port = 443
    }
}