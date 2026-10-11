variable "recovery_protection_policies" {
  description = <<EOT
Map of recovery_protection_policies, attributes below
Required:
    - backup_retention_period_in_days
    - compartment_id
    - display_name
Optional:
    - defined_tags
    - freeform_tags
    - must_enforce_cloud_locality
    - policy_locked_date_time
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    backup_retention_period_in_days = number
    compartment_id                  = string
    display_name                    = string
    defined_tags                    = optional(map(string))
    freeform_tags                   = optional(map(string))
    must_enforce_cloud_locality     = optional(bool)
    policy_locked_date_time         = optional(string)
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
}

