resource "aws_inspector_assessment_target" "main" {
  name     = "default-assessment-target"
  resource_group_arn = null

  tags = var.tags
}

resource "aws_inspector_assessment_template" "main" {
  name                = "default-template"
  assessment_target_arn = aws_inspector_assessment_target.main.arn
  duration            = 3600
  rules_package_arns  = ["arn:aws:inspector:us-west-2:123456789012:rulespackage/0-abc12345"]

  tags = var.tags
}

output "assessment_template_arn" {
  value = aws_inspector_assessment_template.main.arn
}
