output "role_assume_role_policy" {
  value = element(coalescelist(concat(module.role[*].assume_role_policy, [null])), 0)
}

output "role_description" {
  value = element(coalescelist(concat(module.role[*].description, [null])), 0)
}

output "role_force_detach_policies" {
  value = element(coalescelist(concat(module.role[*].force_detach_policies, [null])), 0)
}

output "role_inline_policy" {
  value = element(coalescelist(concat(module.role[*].inline_policy, [null])), 0)
}

output "role_managed_policy_arns" {
  value = element(coalescelist(concat(module.role[*].managed_policy_arns, [null])), 0)
}

output "role_max_session_duration" {
  value = element(coalescelist(concat(module.role[*].max_session_duration, [null])), 0)
}

output "role_name_prefix" {
  value = element(coalescelist(concat(module.role[*].name_prefix, [null])), 0)
}

output "role_path" {
  value = element(coalescelist(concat(module.role[*].path, [null])), 0)
}

output "role_permissions_boundary" {
  value = element(coalescelist(concat(module.role[*].permissions_boundary, [null])), 0)
}

output "role_tags" {
  value = element(coalescelist(concat(module.role[*].tags, [null])), 0)
}

output "role_arn" {
  value = element(coalescelist(concat(module.role[*].arn, [null])), 0)
}

output "role_create_date" {
  value = element(coalescelist(concat(module.role[*].create_date, [null])), 0)
}

output "role_id" {
  value = element(coalescelist(concat(module.role[*].id, [null])), 0)
}

output "role_name" {
  value = element(coalescelist(concat(module.role[*].name, [null])), 0)
}

output "role_tags_all" {
  value = element(coalescelist(concat(module.role[*].tags_all, [null])), 0)
}

output "role_unique_id" {
  value = element(coalescelist(concat(module.role[*].unique_id, [null])), 0)
}

output "role_policies_attachment" {
  value = element(coalescelist(concat(module.role[*].policies_attachment, [null])), 0)
}

output "role_policies" {
  value = element(coalescelist(concat(module.role[*].policies, [null])), 0)
}

# output "function_file" {
#   description = "The file containing the function source code"
#   value       = data.archive_file.function_filename.source_file
# }

# output "function_archive" {
#   description = "The archive containing the function files"
#   value       = data.archive_file.function_filename.output_path
# }

output "function_function_name" {
  value = module.function.function_name
}

output "function_role" {
  value = module.function.role
}

output "function_code_signing_config_arn" {
  value = module.function.code_signing_config_arn
}

output "function_dead_letter_config" {
  value = module.function.dead_letter_config
}

output "function_description" {
  value = module.function.description
}

output "function_environment" {
  value = module.function.environment
}

output "function_file_system_config" {
  value = module.function.file_system_config
}

output "function_filename" {
  value = module.function.filename
}

output "function_handler" {
  value = module.function.handler
}

output "function_image_config" {
  value = module.function.image_config
}

output "function_image_uri" {
  value = module.function.image_uri
}

output "function_kms_key_arn" {
  value = module.function.kms_key_arn
}

output "function_layers" {
  value = module.function.layers
}

output "function_memory_size" {
  value = module.function.memory_size
}

output "function_package_type" {
  value = module.function.package_type
}

output "function_publish" {
  value = module.function.publish
}

output "function_reserved_concurrent_executions" {
  value = module.function.reserved_concurrent_executions
}

output "function_runtime" {
  value = module.function.runtime
}

output "function_s3_bucket" {
  value = module.function.s3_bucket
}

output "function_s3_key" {
  value = module.function.s3_key
}

output "function_s3_object_version" {
  value = module.function.s3_object_version
}

output "function_source_code_hash" {
  value = module.function.source_code_hash
}

output "function_tags" {
  value = module.function.tags
}

output "function_timeout" {
  value = module.function.timeout
}

output "function_tracing_config" {
  value = module.function.tracing_config
}

output "function_vpc_config" {
  value = module.function.vpc_config
}

output "function_arn" {
  value = module.function.arn
}

output "function_invoke_arn" {
  value = module.function.invoke_arn
}

output "function_last_modified" {
  value = module.function.last_modified
}

output "function_qualified_arn" {
  value = module.function.qualified_arn
}

output "function_signing_job_arn" {
  value = module.function.signing_job_arn
}

output "function_signing_profile_version_arn" {
  value = module.function.signing_profile_version_arn
}

output "function_source_code_size" {
  value = module.function.source_code_size
}

output "function_tags_all" {
  value = module.function.tags_all
}

output "function_version" {
  value = module.function.version
}

output "function_vpc_config_vpc_id" {
  value = module.function.vpc_config_vpc_id
}

output "function_alias_name" {
  value = module.function.alias_name
}

output "function_alias_description" {
  value = module.function.alias_description
}

output "function_alias_function_name" {
  value = module.function.alias_function_name
}

output "function_alias_function_version" {
  value = module.function.alias_function_version
}

output "function_alias_routing_config" {
  value = module.function.alias_routing_config
}

output "function_alias_arn" {
  value = module.function.alias_arn
}

output "function_alias_invoke_arn" {
  value = module.function.alias_invoke_arn
}

output "function_permission_action" {
  value = module.function.permission_action
}

output "function_permission_event_source_token" {
  value = module.function.permission_event_source_token
}

output "function_permission_function_name" {
  value = module.function.permission_function_name
}

output "function_permission_principal" {
  value = module.function.permission_principal
}

output "function_permission_qualifier" {
  value = module.function.permission_qualifier
}

output "function_permission_source_account" {
  value = module.function.permission_source_account
}

output "function_permission_source_arn" {
  value = module.function.permission_source_arn
}

output "function_permission_statement_id" {
  value = module.function.permission_statement_id
}

output "function_permission_statement_id_prefix" {
  value = module.function.permission_statement_id_prefix
}

output "function_alias_permission_action" {
  value = module.function.alias_permission_action
}

output "function_alias_permission_event_source_token" {
  value = module.function.alias_permission_event_source_token
}

output "function_alias_permission_function_name" {
  value = module.function.alias_permission_function_name
}

output "function_alias_permission_principal" {
  value = module.function.alias_permission_principal
}

output "function_alias_permission_qualifier" {
  value = module.function.alias_permission_qualifier
}

output "function_alias_permission_source_account" {
  value = module.function.alias_permission_source_account
}

output "function_alias_permission_source_arn" {
  value = module.function.alias_permission_source_arn
}

output "function_alias_permission_statement_id" {
  value = module.function.alias_permission_statement_id
}

output "function_alias_permission_statement_id_prefix" {
  value = module.function.alias_permission_statement_id_prefix
}

output "function_log_group_name" {
  value = module.function.log_group_name
}

output "function_log_group_name_prefix" {
  value = module.function.log_group_name_prefix
}

output "function_log_group_retention_in_days" {
  value = module.function.log_group_retention_in_days
}

output "function_log_group_kms_key_id" {
  value = module.function.log_group_kms_key_id
}

output "function_log_group_tags" {
  value = module.function.log_group_tags
}

output "function_log_group_arn" {
  value = module.function.log_group_arn
}

output "function_log_group_tags_all" {
  value = module.function.log_group_tags_all
}
