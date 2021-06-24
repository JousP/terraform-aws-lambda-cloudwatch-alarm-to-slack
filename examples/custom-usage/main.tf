# Create a custom role for the lambda function
module "lambda_role" {
  source              = "JousP/iam-assumeRole/aws"
  version             = "~> 3.2"
  name                = "custom-usage-lambda-role"
  service_identifiers = ["lambda.amazonaws.com"]
  managed_policy_arns = ["arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"]
}

# Create the lambda function
module "custom_usage" {
  source               = "JousP/lambda-cloudwatch-alarm-to-slack/aws"
  version              = "~> 3.0"
  function_name        = "cloudwatch-alarm-to-slack-custom"
  description          = "Push Cloudwatch Alarms Notifications to Slack"
  slack_webhook_url    = "https://hooks.slack.com/services/XXX/XXX/XXX"
  slack_channel        = "aws-notifications"
  slack_username       = "cloudwatch-alarm-to-slack-custom"
  log_events           = true
  create_role          = false
  role                 = module.lambda_role.arn
  permission_principal = "sns.amazonaws.com"
  vpc_config = {
    subnet_ids         = [aws_subnet.aza.id, aws_subnet.azb.id]
    security_group_ids = [aws_security_group.sg.id]
  }
  function_tags = {
    SNSTopic = "MySNSTopic"
  }
}
