resource "oci_recovery_protection_policy" "recovery_protection_policies" {
  for_each = var.recovery_protection_policies

  backup_retention_period_in_days = each.value.backup_retention_period_in_days
  compartment_id                  = each.value.compartment_id
  display_name                    = each.value.display_name
  defined_tags                    = each.value.defined_tags
  freeform_tags                   = each.value.freeform_tags
  must_enforce_cloud_locality     = each.value.must_enforce_cloud_locality
  policy_locked_date_time         = each.value.policy_locked_date_time

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

