variable "waf_mappings" {
    type = object({
        name_prefix = string
        enable_shield_advanced = bool
        shield_count = number
    })
}

variable "alb_arn" {
    type = string
}