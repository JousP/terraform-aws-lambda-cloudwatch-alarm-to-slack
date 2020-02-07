variable "function_name" {
  description = "(Required) A unique name for your Lambda Function."
  type        = "string"
}

variable "description" {
  description = "Description of what your Lambda Function does."
  type        = "string"
  default     = "Push Cloudwatch Alarms Notifications to Slack"
}

variable "role" {
  description = "IAM role attached to the Lambda Function. This governs both who / what can invoke your Lambda Function, as well as what resources our Lambda Function has access to. See Lambda Permission Model for more details."
  type        = "string"
  default     = ""
}

variable "memory_size" {
  description = "(Optional) Amount of memory in MB your Lambda Function can use at runtime. Defaults to 128. See Limits"
  default     = 128
}

variable "timeout" {
  description = "The amount of time your Lambda Function has to run in seconds. Defaults to 3. See Limits"
  default     = 30
}

variable "reserved_concurrent_executions" {
  description = "(Optional) The amount of reserved concurrent executions for this lambda function. Defaults to Unreserved Concurrency Limits. See Managing Concurrency"
  default     = "-1"
}

variable "publish" {
  description = "(Optional) Whether to publish creation/change as new Lambda Function Version. Defaults to false."
  default     = false
}

variable "vpc_subnet_ids" {
  description = "(Optional) Provide this to allow your function to access your VPC. A list of subnet IDs associated with the Lambda function."
  default     = []
  type        = "list"
}

variable "vpc_security_group_ids" {
  description = "(Optional) Provide this to allow your function to access your VPC. A list of security group IDs associated with the Lambda function."
  default     = []
  type        = "list"
}

variable "kms_key_arn" {
  description = "(Optional) The ARN for the KMS encryption key."
  type        = "string"
  default     = ""
}

variable "permission_principal" {
  description = "(Required) The principal who is getting this permission. e.g. s3.amazonaws.com, an AWS account ID, or any valid AWS service principal such as events.amazonaws.com or sns.amazonaws.com."
  type        = "string"
  default     = ""
}

variable "permission_action" {
  description = "(Optional) The AWS Lambda action you want to allow in this statement. (e.g. lambda:InvokeFunction)"
  type        = "string"
  default     = "lambda:InvokeFunction"
}

variable "permission_source_account" {
  description = "(Optional) This parameter is used for S3 and SES. The AWS account ID (without a hyphen) of the source owner."
  type        = "string"
  default     = ""
}

variable "permission_source_arn" {
  description = "(Optional) When granting Amazon S3 or CloudWatch Events permission to invoke your function, you should specify this field with the Amazon Resource Name (ARN) for the S3 Bucket or CloudWatch Events Rule as its value. This ensures that only events generated from the specified bucket or rule can invoke the function. API Gateway ARNs have a unique structure described here."
  type        = "string"
  default     = ""
}

variable "log_group_retention_in_days" {
  description = "(Optional) Specifies the number of days you want to retain log events in the specified log group."
  default     = 7
}

variable "function_tags" {
  description = "Key-value mapping of tags for the lambda function"
  type        = "map"
  default     = {}
}

variable "create_alias" {
  description = "Whether to create an aws_lambda_alias"
  default     = false
}

variable "alias_name" {
  description = "(Optional) Name of the aws_lambda_alias."
  type        = "string"
  default     = "latest"
}

variable "alias_function_version" {
  description = "(Optional) Version of the lambda function for the alias."
  type        = "string"
  default     = "$LATEST"
}

variable "slack_webhook_url" {
  description = "The URL of Slack webhook"
  type        = "string"
}

variable "slack_channel" {
  description = "The name of the channel in Slack for notifications"
  type        = "string"
}

variable "slack_username" {
  description = "The username that will appear on Slack messages"
  type        = "string"
  default     = "aws-lambda"
}

variable "slack_emoji" {
  description = "A custom emoji that will appear on Slack messages"
  type        = "string"
  default     = ":cloud:"
}

variable "log_events" {
  description = "Boolean flag to enabled/disable logging of incoming events"
  default     = false
}

variable "create_role" {
  description = "Whether to create a role for the lambda function"
  default     = true
}

variable "role_name" {
  description = "(Required) The name of the role."
  type        = "string"
  default     = ""
}

variable "role_description" {
  description = "(Required) The description of the role."
  type        = "string"
  default     = ""
}

variable "role_assume_role_policy" {
  description = "(Optional) Specific policy to assume that role, if not whole account required."
  type        = "string"
  default     = ""
}

variable "role_force_detach_policies" {
  description = "(Optional) Specifies to force detaching any policies the role has before destroying it. Defaults to true."
  default     = true
}

variable "role_path" {
  description = "(Optional) The path to the role."
  type        = "string"
  default     = "/lambda/"
}

variable "role_max_session_duration" {
  description = "(Optional) The maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours."
  type        = "string"
  default     = "3600"
}

variable "role_permissions_boundary" {
  description = "(Optional) The ARN of the policy that is used to set the permissions boundary for the role."
  type        = "string"
  default     = ""
}

variable "role_tags" {
  description = "Key-value mapping of tags for the IAM role"
  type        = "map"
  default     = {}
}

variable "role_policies_count" {
  description = "(Optional) Number of AWS policies provided"
  default     = 1
}

variable "role_policies" {
  description = "(Optional) The ARNs of policies to directly attach to the role"
  type        = "list"
  default     = ["arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"]
}

variable "role_json_policies_count" {
  description = "(Optional) Number of JSON formatted policies provided"
  default     = 0
}

variable "role_json_policies" {
  description = "(Optional) The JSON formatted inline policies for the role"
  type        = "list"
  default     = [""]
}

variable "tags" {
  description = "(Optional) Map of tags to add to all resources"
  type        = "map"
  default     = {}
}

variable "enabled" {
  description = "Whether resources have to be deployed"
  default     = true
}

