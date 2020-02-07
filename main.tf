locals {
  default            = {
    role_name        = "${var.role_name == "" ? "role_${var.function_name}" : var.role_name}"
    role_description = "${var.role_description == "" ? "Role for lambda function ${var.function_name}" : var.role_description}"
  }
  role               = "${var.role == "" ? module.role.arn : var.role}"
}

module "role" {
  source                = "JousP/iam-assumeRole/aws"
  version               = "~> 1.0"
  enabled               = "${var.create_role}"
  name                  = "${local.default["role_name"]}"
  description           = "${local.default["role_description"]}"
  assume_role_policy    = "${var.role_assume_role_policy}"
  force_detach_policies = "${var.role_force_detach_policies}"
  path                  = "${var.role_path}"
  max_session_duration  = "${var.role_max_session_duration}"
  permissions_boundary  = "${var.role_permissions_boundary}"
  tags                  = "${merge(var.tags, var.role_tags)}"
  policies_count        = "${var.role_policies_count}"
  policies              = "${var.role_policies}"
  json_policies_count   = "${var.role_json_policies_count}"
  json_policies         = "${var.role_json_policies}"
  service               = "lambda.amazonaws.com"
}

data "null_data_source" "function_file" {
  inputs = {
    filename = "${path.module}/lambda/function.py"
  }
}

data "null_data_source" "function_archive" {
  inputs = {
    filename = "${path.module}/lambda/function.zip"
  }
}

data "archive_file" "function_filename" {
  type        = "zip"
  source_file = "${data.null_data_source.function_file.outputs.filename}"
  output_path = "${data.null_data_source.function_archive.outputs.filename}"
}

module "function" {
  source                         = "JousP/lambda-function/aws"
  version                        = "~> 1.0"
  enabled                        = "${var.enabled}"
  filename                       = "${data.archive_file.function_filename.output_path}"
  function_name                  = "${var.function_name}"
  handler                        = "function.lambda_handler"
  role                           = "${local.role}"
  description                    = "${var.description}"
  memory_size                    = "${var.memory_size}"
  runtime                        = "python3.7"
  timeout                        = "${var.timeout}"
  reserved_concurrent_executions = "${var.reserved_concurrent_executions}"
  publish                        = "${var.publish}"
  vpc_subnet_ids                 = "${var.vpc_subnet_ids}"
  vpc_security_group_ids         = "${var.vpc_security_group_ids}"
  environment_variables          = {
    SLACK_WEBHOOK_URL            = "${var.slack_webhook_url}"
    SLACK_CHANNEL                = "${var.slack_channel}"
    SLACK_USERNAME               = "${var.slack_username}"
    SLACK_EMOJI                  = "${var.slack_emoji}"
    LOG_EVENTS                   = "${var.log_events ? "True" : "False"}"
  }
  kms_key_arn                    = "${var.kms_key_arn}"
  source_code_hash               = "${data.archive_file.function_filename.output_base64sha256}"
  permission_principal           = "${var.permission_principal}"
  permission_action              = "${var.permission_action}"
  permission_source_account      = "${var.permission_source_account}"
  permission_source_arn          = "${var.permission_source_arn}"
  log_group_retention_in_days    = "${var.log_group_retention_in_days}"
  tags                           = "${merge(var.tags, var.function_tags)}"
  create_alias                   = "${var.create_alias}"
  alias_function_version         = "${var.alias_function_version}"
  alias_name                     = "${var.alias_name}"
}
