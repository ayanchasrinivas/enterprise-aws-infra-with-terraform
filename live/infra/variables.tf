variable "vpc_mappings" {
  description = "vpc_mappings"
  type = object({
    environment          = string
    name                 = string
    team                 = string
    public_type = string
    private_type = string
    name_prefix          = string
    vpc_cidr             = string
    az_count             = number
    enable_dns_support   = bool
    enable_dns_hostnames = bool
    single_nat_gateway = bool
  })
}

variable "security_group_mappings" {
    description = "security_group_mappings"
    type = object({
        name_prefix = string
        name = string
        environment = string
        team = string
    })
}

variable "security_group_vpc_id" {
    description = "security_group_vpc_id"
    type = string
}

variable "admin_cidrs" {
    description = "allowed_ingress_cidrs"
    type = list(string)
    default = []
}

variable "subnet_ids" {
    type = list(string)
}

variable "security_group_ids" {
    type = list(string)
}

variable "ec2_mappings" {
    type = object({
        name_prefix = string
        instance_type = string
        instance_count = string
        ami_id = string
        volume_size = string
        volume_type = string
    })
}

variable "iam_mappings" = {
    type = object({
        name_prefix = string
    })
}

variable "iam_devops_users" {
    type = list(string)
    default = []
}

variable "lightsail_mappings" {
    type = object({
        instance_count = number
        name_prefix = string
        blueprint_id = string
        bundle_id = string
        key_pair_name = string 
    })
}

variable "ecr_mappings" {
    type = object({
        name_prefix = string
    })
}

variable "hotstar_ecr_repositories" {
    type = list(string)
}

variable "efs_mappings" {
    type = object({
        name_prefix = string
    })
}


variable "alb_mappings" {
  type = object({
    name_prefix = string
  })
}

variable "waf_mappings" {
    type = object({
        name_prefix = string
        enable_shield_advanced = bool
        shield_count = number
    })
}