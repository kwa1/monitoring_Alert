resource "aws_guardduty_detector" "main" {
  enable = true

  tags = var.tags
}

resource "aws_guardduty_publishing_destination" "sns" {
  detector_id = aws_guardduty_detector.main.id
  destination_arn = var.sns_topic_arn
}

output "detector_id" {
  value = aws_guardduty_detector.main.id
}
