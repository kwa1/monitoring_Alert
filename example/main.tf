provider "aws" {
  region = var.region
}

module "sns" {
  source         = "./modules/sns"
  email_endpoint = var.email_endpoint
  sms_endpoint   = var.sms_endpoint
  tags           = var.tags
}

module "guardduty" {
  source       = "./modules/guardduty"
  sns_topic_arn = module.sns.topic_arn
  tags         = var.tags
}

module "inspector" {
  source       = "./modules/inspector"
  sns_topic_arn = module.sns.topic_arn
  tags         = var.tags
}

module "iam" {
  source = "./modules/iam"
  tags   = var.tags
}

module "cloudwatch" {
  source          = "./modules/cloudwatch"
  sns_topic_arn   = module.sns.topic_arn
  guardduty_alarm = var.guardduty_alarm
  inspector_alarm = var.inspector_alarm
  tags            = var.tags
}
