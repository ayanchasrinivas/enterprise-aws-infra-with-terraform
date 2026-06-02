variable "lightsail_mappings" {
    type = object({
        instance_count = number
        name_prefix = string
        blueprint_id = string
        bundle_id = string
        key_pair_name = string
    })
}