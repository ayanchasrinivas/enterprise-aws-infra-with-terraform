resource "aws_wafv2_web_acl" "hotstar_web_acl" {
    name = "${var.waf_mappings.name_prefix}-web-acl"
    description = "Managed WAF rules and rate limiting"
    scope = "REGIONAL"

    default_action {
        allow{}
    }

    rule {
        name = "AWSManagedRulesCommonRuleSet"
        priority = 10
        override_action {
            none {}
        }
        statement {
            managed_rule_group_statement {
                name = "AWSManagedRulesCommonRuleSet"
                vendor_name = "AWS"
            }
        }
        visibility_config {
            cloudwatch_metrics_enabled = true
            metric_name                = "common"
            sampled_requests_enabled   = true
        }
    }

    rule {
        name = "AWSManagedRulesKnownBadInputsRuleSet"
        priority = 20
        override_action {
            none {}
        }
        statement {
            managed_rule_group_statement {
                name = "AWSManagedRulesKnownBadInputsRuleSet"
                vendor_name = "AWS"
            }
        }
        visibility_config {
            cloudwatch_metrics_enabled = true
            metric_name = "known-bad-inputs"
            sampled_requests_enabled = true
        }
    }

    rule {
        name = "RateLimit"
        priority = 30
        action {
            block {}
        }
        statement {
            rate_based_statement {
                limit = 2000
                aggregate_key_type = "IP"
            }
        }
        visibility_config {
            cloudwatch_metrics_enabled = true
            metric_name = "rate-limit"
            sampled_requests_enabled = true
        }
    }

    visibility_config {
        cloudwatch_metrics_enabled = true
        metric_name = "${var.waf_mappings.name_prefix}-web-acl"
        sampled_requests_enabled = true
    }
}

resource "aws_wafv2_web_acl_association" "hotstar_web_acl_alb_association" {
    resource_arn = var.alb_arn
    web_acl_arn = aws_wafv2_web_acl.hotstar_web_acl.arn
}

resource "aws_shield_protection" "hotstar_web_alb_shield_protection" {
    count = var.waf_mappings.shield_count
    name = "${var.waf_mappings.name_prefix}-alb-shield"
    resource_arn = var.alb_arn
}