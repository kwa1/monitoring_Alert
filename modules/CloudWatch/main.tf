##CloudWatch Module

resource "aws_cloudwatch_metric_alarm" "guardduty_alarm" {
  alarm_name          = "GuardDutyFindingsAlarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "Severity"
  namespace           = "AWS/GuardDuty"
  period              = 300
  statistic           = "Maximum"
  threshold           = var.guardduty_alarm_threshold
  alarm_description   = "Alarm for GuardDuty findings exceeding threshold"
  actions_enabled     = true

  alarm_actions = [var.sns_topic_arn]

  dimensions = {
    DetectorId = var.guardduty_detector_id
  }

  tags = var.tags
}

resource "aws_cloudwatch_metric_alarm" "inspector_alarm" {
  alarm_name          = "InspectorFindingsAlarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "HighSeverityFindings"
  namespace           = "AWS/Inspector"
  period              = 300
  statistic           = "Maximum"
  threshold           = var.inspector_alarm_threshold
  alarm_description   = "Alarm for Inspector findings exceeding threshold"
  actions_enabled     = true

  alarm_actions = [var.sns_topic_arn]

  tags = var.tags
}
