data "aws_iam_policy_document" "hotstar_ec2_assume" {
    statement {
        actions = ["sts:AssumeRole"]
        principals {
            type = "Service"
            identifiers = ["ec2.amazonaws.com"]
        }
    }
}

data "aws_caller_identity" "current" {}
data "aws_iam_policy_document" "hotstar_platform_admin_assume" {
    statement {
        actions = ["sts:AssumeRole"]
        principals {
            type = "AWS"
            identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
        }
    }
}
