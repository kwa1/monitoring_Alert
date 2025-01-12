resource "aws_sns_topic" "security_alerts" {
  name = "security-alerts"

  tags = var.tags
}

resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.security_alerts.arn
  protocol  = "email"
  endpoint  = var.email_endpoint
}

resource "aws_sns_topic_subscription" "sms" {
  topic_arn = aws_sns_topic.security_alerts.arn
  protocol  = "sms"
  endpoint  = var.sms_endpoint
}

output "topic_arn" {
  value = aws_sns_topic.security_alerts.arn
}
