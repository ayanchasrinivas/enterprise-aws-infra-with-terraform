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