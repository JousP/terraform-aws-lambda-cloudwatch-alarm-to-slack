variable "slack_webhook_url" {
  description = "The URL of Slack webhook"
  type        = string
}

variable "slack_channel" {
  description = "The name of the channel in Slack for notifications"
  type        = string
}

variable "slack_username" {
  description = "The username that will appear on Slack messages"
  type        = string
  default     = "aws-lambda"
}

variable "slack_emoji" {
  description = "A custom emoji that will appear on Slack messages"
  type        = string
  default     = ":cloud:"
}

variable "log_events" {
  description = "Boolean flag to enabled/disable logging of incoming events"
  type        = bool
  default     = false
}

variable "function_name" {
  description = "A unique name for your Lambda Function."
  type        = string
}

variable "role" {
  description = "IAM role attached to the Lambda Function. This governs both who / what can invoke your Lambda Function, as well as what resources our Lambda Function has access to. See Lambda Permission Model for more details."
  type        = string
  default     = null
}

variable "code_signing_config_arn" {
  description = "To enable code signing for this function, specify the ARN of a code-signing configuration. A code-signing configuration includes a set of signing profiles, which define the trusted publishers for this function."
  type        = string
  default     = null
}

variable "description" {
  description = "Description of what your Lambda Function does."
  type        = string
  default     = "Push Cloudwatch Alarms Notifications to Slack"
}

variable "kms_key_arn" {
  description = "key that is used to encrypt environment variables. If this configuration is not provided when environment variables are in use, AWS Lambda uses a default service key. If this configuration is provided when environment variables are not in use, the AWS Lambda API does not save this configuration and Terraform will show a perpetual difference of adding the key. To fix the perpetual difference, remove this configuration."
  type        = string
  default     = null
}

variable "memory_size" {
  description = "Amount of memory in MB your Lambda Function can use at runtime. Defaults to 128. See Limits"
  type        = number
  #  default     = 128
  default = null
}

variable "publish" {
  description = "Whether to publish creation/change as new Lambda Function Version. Defaults to false."
  type        = bool
  default     = null
}

variable "reserved_concurrent_executions" {
  description = "Amount of reserved concurrent executions for this lambda function. A value of 0 disables lambda from being triggered and -1 removes any concurrency limitations. Defaults to Unreserved Concurrency Limits -1. See Managing Concurrency"
  type        = number
  default     = null
}

variable "timeout" {
  description = "Amount of time your Lambda Function has to run in seconds. Defaults to 3. See Limits."
  type        = number
  #  default     = 30
  default = null
}

variable "dead_letter_config" {
  description = "A map to configure the function's dead letter queue. It must contain one argument called `target_arn`- The ARN of an SNS topic or SQS queue to notify when an invocation fails. If this option is used, the function's IAM role must be granted suitable access to write to the target object, which means allowing either the sns:Publish or sqs:SendMessage action on this ARN, depending on which service is targeted."
  type = object({
    target_arn = string
  })
  default = null
}

variable "tracing_config" {
  description = "A map that describes the tracing configuration. The map must have one argument `mode` - Can be either PassThrough or Active. If PassThrough, Lambda will only trace the request from an upstream service if it contains a tracing header with \"sampled=1\". If Active, Lambda will respect any tracing header it receives from an upstream service. If no tracing header is received, Lambda will call X-Ray for a tracing decision."
  type = object({
    mode = string
  })
  default = null
}

variable "vpc_config" {
  description = "Provide this to allow your function to access your VPC. See Lambda in VPC. This variable is a map with 2 arguments : `subnet_ids` - A list of security group IDs associated with the Lambda function."
  type = object({
    subnet_ids         = list(string)
    security_group_ids = list(string)
  })
  default = null
}

variable "alias_name" {
  description = "Name of the aws_lambda_alias."
  type        = string
  default     = "latest"
}

variable "alias_function_version" {
  description = "Version of the lambda function for the alias."
  type        = string
  default     = "$LATEST"
}

variable "alias_routing_config" {
  description = "A map that defines the proportion of events that should be sent to different versions of a lambda function."
  type = object({
    additional_version_weights = map(number)
  })
  default = null
}

variable "permission_action" {
  description = "The AWS Lambda action you want to allow in this statement. (e.g. lambda:InvokeFunction)"
  type        = string
  default     = "lambda:InvokeFunction"
}

variable "permission_event_source_token" {
  description = "The Event Source Token to validate. Used with Alexa Skills."
  type        = string
  default     = null
}

variable "permission_principal" {
  description = "The principal who is getting this permission. e.g. s3.amazonaws.com, an AWS account ID, or any valid AWS service principal such as events.amazonaws.com or sns.amazonaws.com."
  type        = string
  default     = null
}

variable "permission_qualifier" {
  description = "Query parameter to specify function version or alias name. The permission will then apply to the specific qualified ARN. e.g. arn:aws:lambda:aws-region:acct-id:function:function-name:2"
  type        = string
  default     = null
}

variable "permission_source_account" {
  description = "of the source owner."
  type        = string
  default     = null
}

variable "permission_source_arn" {
  description = "for the S3 Bucket or CloudWatch Events Rule as its value. This ensures that only events generated from the specified bucket or rule can invoke the function. API Gateway ARNs have a unique structure described here."
  type        = string
  default     = null
}

variable "permission_statement_id" {
  description = "A unique statement identifier. By default generated by Terraform."
  type        = string
  default     = null
}

variable "permission_statement_id_prefix" {
  description = "A statement identifier prefix. Terraform will generate a unique suffix. Conflicts with statement_id."
  type        = string
  default     = null
}


variable "alias_permission_action" {
  description = "The AWS Lambda action you want to allow in this statement. (e.g. lambda:InvokeFunction)"
  type        = string
  default     = "lambda:InvokeFunction"
}

variable "alias_permission_event_source_token" {
  description = "The Event Source Token to validate. Used with Alexa Skills."
  type        = string
  default     = null
}

variable "alias_permission_principal" {
  description = "The principal who is getting this permission. e.g. s3.amazonaws.com, an AWS account ID, or any valid AWS service principal such as events.amazonaws.com or sns.amazonaws.com."
  type        = string
  default     = null
}

variable "alias_permission_source_account" {
  description = "of the source owner."
  type        = string
  default     = null
}

variable "alias_permission_source_arn" {
  description = "for the S3 Bucket or CloudWatch Events Rule as its value. This ensures that only events generated from the specified bucket or rule can invoke the function. API Gateway ARNs have a unique structure described here."
  type        = string
  default     = null
}

variable "alias_permission_statement_id" {
  description = "A unique statement identifier. By default generated by Terraform."
  type        = string
  default     = null
}

variable "alias_permission_statement_id_prefix" {
  description = "A statement identifier prefix. Terraform will generate a unique suffix. Conflicts with statement_id."
  type        = string
  default     = null
}

variable "log_group_retention_in_days" {
  description = "Specifies the number of days you want to retain log events in the specified log group. Default: 7"
  type        = number
  default     = 7
}

variable "create_alias" {
  description = "Whether to create an aws_lambda_alias"
  type        = bool
  default     = false
}

variable "function_tags" {
  description = "Map of tags to add to the lambda function's related resources"
  type        = map(string)
  default     = {}
}

variable "create_role" {
  description = "Wether to create a role for the lambda function"
  type        = bool
  default     = true
}

variable "role_assume_role_policy" {
  description = "Specific policy to assume that role, if not whole account required."
  type        = string
  default     = null
}

variable "role_description" {
  description = "The description of the role."
  type        = string
  default     = null
}

variable "role_force_detach_policies" {
  description = "Specifies to force detaching any policies the role has before destroying it. Defaults to true."
  type        = bool
  default     = true
}

variable "role_inline_policy" {
  description = "will cause Terraform to remove all inline policies."
  type = list(object({
    name   = string
    policy = string
  }))
  default = []
}

variable "role_managed_policy_arns" {
  description = "will cause Terraform to remove all managed policy attachments."
  type        = list(string)
  default     = ["arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"]
}

variable "role_max_session_duration" {
  description = "that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours."
  type        = number
  default     = null
}

variable "role_name" {
  description = "The name of the role."
  type        = string
  default     = null
}

variable "role_name_prefix" {
  description = "Creates a unique friendly name beginning with the specified prefix. Conflicts with name."
  type        = string
  default     = null
}

variable "role_path" {
  description = "The path to the role."
  type        = string
  default     = "/lambda/"
}

variable "role_permissions_boundary" {
  description = "The ARN of the policy that is used to set the permissions boundary for the role."
  type        = string
  default     = null
}

variable "role_tags" {
  description = "Key-value mapping of tags for the IAM role"
  type        = map(string)
  default     = null
}

variable "role_policies_count" {
  description = "Number of AWS policies provided in the `policies` variable"
  type        = number
  default     = 0
}

variable "role_policies" {
  description = "The ARNs of policies to directly attach to the role"
  type        = list(string)
  default     = []
}

variable "role_json_policies_count" {
  description = "Number of JSON formatted inline policies provided in the `json_policies` variable"
  type        = number
  default     = 0
}

variable "role_json_policies" {
  description = "The JSON formatted inline policies for the role"
  type        = list(string)
  default     = []
}

# AssumeRole Default Policy Customization
variable "role_aws_identifiers" {
  description = "list of Identifiers for principal of type \"AWS\", these are IAM user or role ARNs."
  type        = list(string)
  default     = []
}

variable "role_service_identifiers" {
  description = "list of Identifiers for principal of type \"Service\", these are AWS service eg. lambda.amazonaws.com."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Map of tags to add to all resources"
  type        = map(string)
  default     = {}
}


