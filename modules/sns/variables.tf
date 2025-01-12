variable "email_endpoint" {
  description = "Email address for alerts"
}

variable "sms_endpoint" {
  description = "Phone number for SMS alerts"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}
