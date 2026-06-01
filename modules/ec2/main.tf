resource "aws_instance" "hotstar_ec2" {
    ami = var.ec2_mappings.ami_id
    count = var.ec2_mappings.instance_count
    instance_type = var.ec2_mappings.instance_type
    subnet_id = var.subnet_ids[count.index % length(var.subnet_ids)]
    vpc_security_group_ids = var.security_group_ids
    associate_public_ip_address = true
    monitoring = true
    hibernation = true
    disable_api_termination = true

    root_block_device {
        volume_size = var.ec2_mappings.volume_size
        volume_type = var.ec2_mappings.volume_type
        encrypted = true
    }

    user_data = <<-EOF
                #!/bin/bash
                apt-get update -y
                apt-get install -y nginx
                systemctl start nginx
                systemctl enable nginx
                EOF

    tags = {
        Name = "${var.ec2_mappings.name_prefix}-EC2-INSTANCE-${count.index + 1}"
    }
}

resource "aws_ebs_volume" "hotstar_ec2_additional_volume" {
    count = var.ec2_mappings.instance_count
    availability_zone = aws_instance.hotstar_ec2[count.index].availability_zone
    size = var.ec2_mappings.volume_size
    type = var.ec2_mappings.volume_type
    encrypted = true

    tags = {
        Name = "${var.ec2_mappings.name_prefix}-app-data-${count.index + 1}"
    }
}

resource "aws_volume_attachment" "hotstar_ec2_additional_volume_attachment" {
    count = var.ec2_mappings.instance_count
    device_name = "/dev/sdf"
    volume_id = aws_ebs_volume.hotstar_ec2_additional_volume[count.index].id
    instance_id = aws_instance.hotstar_ec2[count.index].id
}