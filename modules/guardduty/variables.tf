variable "sns_topic_arn" {
  description = "SNS topic ARN for GuardDuty findings"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}
