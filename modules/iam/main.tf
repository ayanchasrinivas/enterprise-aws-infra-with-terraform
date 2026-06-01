resource "aws_iam_role" "hotstar_ec2_iam_role" {
    name = "${var.iam_mappings.name_prefix}-EC2-IAM-ROLE"
    assume_role_policy = data.aws_iam_policy_document.hotstar_ec2_assume.json
}

resource "aws_iam_role_policy_attachment" "hotstar_ec2_ssm_policy_attachment" {
    role = aws_iam_role.hotstar_ec2_iam_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy_attachment" "hotstar_ec2_cloudwatch_policy_attachment" {
    role = aws_iam_role.hotstar_ec2_iam_role.name
    policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

resource "aws_iam_instance_profile" "hotstar_ec2_iam_instance_profile" {
    name = "${var.iam_mappings.name_prefix}-EC2-INSTANCE-PROFILE"
    role = aws_iam_role.hotstar_ec2_iam_role.name
}

resource "aws_iam_role" "hotstar_platform_admin_iam_role" {
    name = "${var.iam_mappings.name_prefix}-PLATFORM-ADMIN-IAM-ROLE"
    assume_role_policy = data.aws_iam_policy_document.hotstar_platform_admin_assume.json
}

resource "aws_iam_role_policy" "hotstar_iam_line_policy" {
    name = "${var.iam_mappings.name_prefix}-platform-admin-inline"
    role = aws_iam_role.hotstar_platform_admin_iam_role.id
    policy = jsonencode ({
        Version = "2012-10-17"
        Statement = [
            {
                Sid    = "TerraformAdminForProject"
        Effect = "Allow"
        Action = [
            "ec2:*",
            "elasticloadbalancing:*",
            "eks:*",
            "ecs:*",
            "ecr:*",
            "rds:*",
            "docdb:*",
            "elasticache:*",
            "kafka:*",
            "es:*",
            "aoss:*",
            "logs:*",
            "cloudwatch:*",
            "iam:Get*",
            "iam:List*",
            "iam:PassRole",
            "wafv2:*",
            "shield:*",
            "route53:*",
            "secretsmanager:*",
            "kms:*",
            "elasticfilesystem:*",
            "lightsail:*"
        ]
        Resource = "*"
        }
        ]
    })
}

resource "aws_iam_group" "hotstar_iam_group" {
    name = "${var.iam_mappings.name_prefix}-DEVOPS-IAM-GROUP"
}

resource "aws_iam_user" "hotstar_iam_users" {
    for_each = toset(var.iam_devops_users)
    name = each.value
}

resource "aws_iam_user_group_membership" "hotstar_iam_user_group_membership" {
    for_each = aws_iam_user.hotstar_iam_users
    user = each.value.name
    groups = [aws_iam_group.hotstar_iam_group.name]
}

