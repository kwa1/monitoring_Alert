## variables.tf
variable "sns_topic_arn" {
  description = "SNS topic ARN for CloudWatch alarms."
}

variable "guardduty_alarm_threshold" {
  description = "Threshold for GuardDuty alarm."
  default     = 1
}

variable "inspector_alarm_threshold" {
  description = "Threshold for Inspector alarm."
  default     = 1
}

variable "guardduty_detector_id" {
  description = "GuardDuty Detector ID."
}

variable "tags" {
  description = "Tags to apply to resources."
  type        = map(string)
}
