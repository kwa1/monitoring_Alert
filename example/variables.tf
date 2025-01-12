variable "region" {
  description = "AWS region for resources"
  default     = "us-west-2"
}

variable "email_endpoint" {
  description = "Email address for security alerts"
  default     = "security-team@example.com"
}

variable "sms_endpoint" {
  description = "Phone number for SMS alerts (E.164 format)"
  default     = "+11234567890"
}

variable "guardduty_alarm" {
  description = "Threshold for GuardDuty alarm"
  default     = 1
}

variable "inspector_alarm" {
  description = "Threshold for Inspector alarm"
  default     = 1
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {
    Environment = "Production"
    Project     = "SecurityMonitoring"
    Owner       = "SecurityTeam"
  }
}
