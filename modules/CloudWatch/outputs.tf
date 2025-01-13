## outputs.tf
output "guardduty_alarm_name" {
  description = "Name of the GuardDuty CloudWatch alarm."
  value       = aws_cloudwatch_metric_alarm.guardduty_alarm.alarm_name
}

output "inspector_alarm_name" {
  description = "Name of the Inspector CloudWatch alarm."
  value       = aws_cloudwatch_metric_alarm.inspector_alarm.alarm_name
}
