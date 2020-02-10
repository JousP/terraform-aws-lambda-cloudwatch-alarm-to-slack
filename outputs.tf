output "role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the role."
  value       = module.role.arn
}

output "role_assume_role_policy" {
  description = "(Required) The policy that grants an entity permission to assume the role."
  value       = module.role.assume_role_policy
}

output "role_create_date" {
  description = "The creation date of the IAM role."
  value       = module.role.create_date
}

output "role_description" {
  description = "The description of the role."
  value       = module.role.description
}

output "role_force_detach_policies" {
  description = "(Optional) Specifies to force detaching any policies the role has before destroying it. Defaults to false."
  value       = module.role.force_detach_policies
}

output "role_id" {
  description = "The name of the role."
  value       = module.role.id
}

output "role_max_session_duration" {
  description = "(Optional) The maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours."
  value       = module.role.max_session_duration
}

output "role_name" {
  description = "The name of the role."
  value       = module.role.name
}

output "role_name_prefix" {
  description = "(Optional, Forces new resource) Creates a unique name beginning with the specified prefix. Conflicts with name."
  value       = module.role.name_prefix
}

output "role_path" {
  description = "(Optional) The path to the role. See IAM Identifiers for more information."
  value       = module.role.path
}

output "role_permissions_boundary" {
  description = "(Optional) The ARN of the policy that is used to set the permissions boundary for the role."
  value       = module.role.permissions_boundary
}

output "role_tags" {
  description = "Key-value mapping of tags for the IAM role"
  value       = module.role.tags
}

output "role_unique_id" {
  description = "The stable and unique string identifying the role."
  value       = module.role.unique_id
}

output "role_policies_attachment" {
  description = "Managed IAM Policies attached to the IAM role"
  value       = module.role.policies_attachment
}

output "role_policies" {
  description = "The role policy ID, in the form of role_name:role_policy_name."
  value       = module.role.policies
}

output "function_file" {
  description = "The file containing the function source code"
  value       = data.null_data_source.function_file.outputs.filename
}

output "function_archive" {
  description = "The archive containing the function files"
  value       = data.archive_file.function_filename.output_path
}

output "function_arn" {
  description = "The Amazon Resource Name (ARN) identifying your Lambda Function."
  value       = module.function.arn
}

output "function_qualified_arn" {
  description = "The Amazon Resource Name (ARN) identifying your Lambda Function Version (if versioning is enabled via publish = true)."
  value       = module.function.qualified_arn
}

output "function_invoke_arn" {
  description = "The ARN to be used for invoking Lambda Function from API Gateway to be used in aws_api_gateway_integration's uri"
  value       = module.function.invoke_arn
}

output "function_version" {
  description = "Latest published version of your Lambda Function."
  value       = module.function.version
}

output "function_last_modified" {
  description = "The date this resource was last modified."
  value       = module.function.last_modified
}

output "function_kms_key_arn" {
  description = "The ARN for the KMS encryption key."
  value     = module.function.kms_key_arn
}

output "function_source_code_hash" {
  description = "Base64-encoded representation of raw SHA-256 sum of the zip file provided either via filename or s3_* parameters."
  value       = module.function.source_code_hash
}

output "function_source_code_size" {
  description = "The size in bytes of the function .zip file."
  value       = module.function.source_code_size
}

output "function_alias_arn" {
  description = "The Amazon Resource Name (ARN) identifying the Lambda function alias."
  value       = module.function.alias_arn
}

output "function_log_group_arn" {
  description = "The Amazon Resource Name (ARN) specifying the log group for the lambda function."
  value       = module.function.log_group_arn
}

output "function_log_group_name" {
  description = "The Name of the log group for the lambda function."
  value       = module.function.log_group_name
}

output "function_log_group_retention_in_days" {
  description = "The number of days log events are retained in the log group for the lambda function."
  value       = module.function.log_group_retention_in_days
}

output "function_log_group_tags" {
  description = "Tags associated with the log group for the lambda function."
  value       = module.function.log_group_tags
}
