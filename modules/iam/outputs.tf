## outputs.tf
output "iam_role_arn" {
  description = "ARN of the IAM role for security monitoring."
  value       = aws_iam_role.security_monitoring.arn
}
