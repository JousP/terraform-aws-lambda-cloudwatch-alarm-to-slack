module "basic_usage" {
  source            = "JousP/lambda-cloudwatch-alarm-to-slack/aws"
  version           = "~> 3.1"
  function_name     = "cloudwatch-alarm-to-slack-basic"
  slack_webhook_url = "https://hooks.slack.com/services/XXX/XXX/XXX"
  slack_channel     = "aws-notifications"
}
