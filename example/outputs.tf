output "sns_topic_arn" {
  description = "ARN of the SNS topic for alerts"
  value       = module.sns.topic_arn
}

output "guardduty_detector_id" {
  description = "GuardDuty Detector ID"
  value       = module.guardduty.detector_id
}

output "inspector_assessment_template_arn" {
  description = "Inspector Assessment Template ARN"
  value       = module.inspector.assessment_template_arn
}

output "iam_role_arn" {
  description = "IAM Role ARN for security notifications"
  value       = module.iam.role_arn
}
