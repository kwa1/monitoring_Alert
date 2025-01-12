## main.tf
resource "aws_iam_role" "security_monitoring" {
  name               = "security-monitoring-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json

  tags = var.tags
}

resource "aws_iam_policy" "guardduty_policy" {
  name   = "GuardDutyMonitoringPolicy"
  policy = data.aws_iam_policy_document.guardduty_policy.json

  tags = var.tags
}

resource "aws_iam_policy" "inspector_policy" {
  name   = "InspectorMonitoringPolicy"
  policy = data.aws_iam_policy_document.inspector_policy.json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "guardduty_attachment" {
  role       = aws_iam_role.security_monitoring.name
  policy_arn = aws_iam_policy.guardduty_policy.arn
}

resource "aws_iam_role_policy_attachment" "inspector_attachment" {
  role       = aws_iam_role.security_monitoring.name
  policy_arn = aws_iam_policy.inspector_policy.arn
}

# Data Sources

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["guardduty.amazonaws.com", "inspector.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "guardduty_policy" {
  statement {
    actions = [
      "guardduty:ListFindings",
      "guardduty:GetFindings",
      "guardduty:ListDetectors",
      "guardduty:GetDetector"
    ]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "inspector_policy" {
  statement {
    actions = [
      "inspector:ListFindings",
      "inspector:GetFindings",
      "inspector:ListAssessmentTemplates",
      "inspector:GetAssessmentTemplate"
    ]
    resources = ["*"]
  }
}
