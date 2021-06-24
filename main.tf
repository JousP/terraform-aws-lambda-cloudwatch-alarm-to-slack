locals {
  default = {
    role_name        = var.role_name == null && var.role_name_prefix == null ? "role_${var.function_name}" : var.role_name
    role_description = var.role_description == null ? "Role for lambda function ${var.function_name}" : var.role_description
  }
}

module "role" {
  source                = "JousP/iam-assumeRole/aws"
  version               = "~> 3.2"
  count                 = var.create_role == true ? 1 : 0
  assume_role_policy    = var.role_assume_role_policy
  description           = local.default["role_description"]
  force_detach_policies = var.role_force_detach_policies
  inline_policy         = var.role_inline_policy
  managed_policy_arns   = var.role_managed_policy_arns
  max_session_duration  = var.role_max_session_duration
  name                  = local.default["role_name"]
  name_prefix           = var.role_name_prefix
  path                  = var.role_path
  permissions_boundary  = var.role_permissions_boundary
  tags                  = merge(var.tags, var.role_tags)
  policies_count        = var.role_policies_count
  policies              = var.role_policies
  json_policies_count   = var.role_json_policies_count
  json_policies         = var.role_json_policies
  aws_identifiers       = var.role_aws_identifiers
  service_identifiers   = concat(["lambda.amazonaws.com"], var.role_service_identifiers)
}

locals {
  lambda_prefix              = join("/", [path.module, "lambda", "function"])
  lambda_archive_source_file = join(".", [local.lambda_prefix, "py"])
  lambda_archive_output_path = join(".", [local.lambda_prefix, "zip"])
}

data "archive_file" "function_filename" {
  type        = "zip"
  source_file = local.lambda_archive_source_file
  output_path = local.lambda_archive_output_path
}

module "function" {
  source                         = "JousP/lambda-function/aws"
  version                        = "~> 3.1"
  function_name                  = var.function_name
  role                           = var.role == null ? module.role[0].arn : var.role
  code_signing_config_arn        = var.code_signing_config_arn
  description                    = var.description
  filename                       = data.archive_file.function_filename.output_path
  handler                        = "function.lambda_handler"
  kms_key_arn                    = var.kms_key_arn
  memory_size                    = var.memory_size
  package_type                   = "Zip"
  publish                        = var.publish
  reserved_concurrent_executions = var.reserved_concurrent_executions
  runtime                        = "python3.7"
  source_code_hash               = data.archive_file.function_filename.output_base64sha256
  timeout                        = var.timeout
  dead_letter_config             = var.dead_letter_config
  environment = {
    variables = {
      SLACK_WEBHOOK_URL = var.slack_webhook_url
      SLACK_CHANNEL     = var.slack_channel
      SLACK_USERNAME    = var.slack_username
      SLACK_EMOJI       = var.slack_emoji
      LOG_EVENTS        = var.log_events ? "True" : "False"
    }
  }
  tracing_config                       = var.tracing_config
  vpc_config                           = var.vpc_config
  alias_name                           = var.alias_name
  alias_function_version               = var.alias_function_version
  alias_routing_config                 = var.alias_routing_config
  permission_action                    = var.permission_action
  permission_event_source_token        = var.permission_event_source_token
  permission_principal                 = var.permission_principal
  permission_qualifier                 = var.permission_qualifier
  permission_source_account            = var.permission_source_account
  permission_source_arn                = var.permission_source_arn
  permission_statement_id              = var.permission_statement_id
  permission_statement_id_prefix       = var.permission_statement_id_prefix
  alias_permission_action              = var.alias_permission_action
  alias_permission_event_source_token  = var.alias_permission_event_source_token
  alias_permission_principal           = var.alias_permission_principal
  alias_permission_source_account      = var.alias_permission_source_account
  alias_permission_source_arn          = var.alias_permission_source_arn
  alias_permission_statement_id        = var.alias_permission_statement_id
  alias_permission_statement_id_prefix = var.alias_permission_statement_id_prefix
  log_group_retention_in_days          = var.log_group_retention_in_days
  tags                                 = merge(var.tags, var.function_tags)
  create_alias                         = var.create_alias
}
