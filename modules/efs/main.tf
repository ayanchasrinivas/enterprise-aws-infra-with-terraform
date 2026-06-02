resource "aws_efs_file_system" "hotstar_aws_efs_file_system" {
    creation_token = "${var.efs_mappings.name_prefix}-efs"
    encrypted = true
    performance_mode = "generalPurpose"
    throughput_mode = "elastic"
    lifecycle_policy {
        transition_to_ia = "AFTER 30 DAYS"
    }
    tags = {
        Name = "${var.efs_mappings.name_prefix}-efs"
    }
}

resource "aws_efs_backup_policy" "hotstar_aws_efs_file_system_backup_policy" {
    file_system_id = aws_efs_file_system.hotstar_aws_efs_file_system.id
    backup_policy {
        status = "ENABLED"
    }
}           

resource "aws_efs_mount_target" "hotstar_aws_efs_file_system_mount_target" {
    count = length(var.subnet_ids)
    file_system_id = aws_efs_file_system.hotstar_aws_efs_file_system.id
    subnet_id = var.subnet_ids[count.index]
    security_groups = [var.security_group_id]
}

resource "aws_efs_access_point" "hotstar_aws_efs_access_point" {
    file_system_id = aws_efs_file_system.hotstar_aws_efs_file_system.id
    posix_user {
        gid = 1000
        uid = 1000
    }
    root_directory {
        path = "/jenkins"
        creation_info {
            owner_gid = 1000
            owner_uid = 1000
            permissions = "0755"
        }
    }
}