# Security Monitoring Terraform Modules

This repository contains reusable Terraform modules to set up security monitoring for AWS environments, following the AWS Well-Architected Framework and robust security practices. The modules integrate with Amazon GuardDuty, AWS Inspector, Amazon SNS, IAM, and CloudWatch for comprehensive monitoring and alerting.

---

## **Features**
- **GuardDuty Integration**: Automatically detects and alerts on security threats.
- **AWS Inspector**: Automates security assessment to improve compliance.
- **Centralized Alerts**: Sends notifications via email and SMS using Amazon SNS.
- **IAM Role Management**: Configures roles and policies for secure operations.
- **CloudWatch Alarms**: Sets thresholds for GuardDuty and Inspector findings to trigger alerts.
- **Tagging**: Applies consistent tags for cost management and resource tracking.

---

## **Modules**
### **1. GuardDuty**
- Enables GuardDuty.
- Publishes findings to an SNS topic.
- Dynamically integrates with other AWS services.

### **2. Inspector**
- Creates assessment targets and templates.
- Integrates with SNS for notification of findings.
- Supports dynamic configuration of rules packages.

### **3. SNS**
- Creates an SNS topic for centralized alerting.
- Supports email and SMS subscriptions.

### **4. IAM**
- Configures IAM roles and policies for secure access.
- Supports conditions to limit access based on tags, IP ranges, and other parameters.

### **5. CloudWatch**
- Configures alarms for GuardDuty and Inspector thresholds.
- Publishes alerts to SNS.

---

## **Prerequisites**
- AWS CLI configured with appropriate permissions.
- Terraform installed (>= 1.3.0).
- AWS account with permissions to manage GuardDuty, Inspector, SNS, IAM, and CloudWatch.

---

## **Usage**
### **Clone the Repository**
```bash
git clone https://github.com/your-org/security-monitoring.git
cd security-monitoring
```

### **Customize Variables**
Edit the `variables.tf` file or pass variables directly via the CLI.

### **Initialize Terraform**
```bash
terraform init
```

### **Plan the Deployment**
```bash
terraform plan -var-file="path/to/your/variables.tfvars"
```

### **Apply the Deployment**
```bash
terraform apply -var-file="path/to/your/variables.tfvars"
```

---

## **Example Variables File**
Create a `variables.tfvars` file:
```hcl
region           = "us-west-2"
email_endpoint   = "security-team@example.com"
sms_endpoint     = "+11234567890"
guardduty_alarm  = 1
inspector_alarm  = 1
tags = {
  Environment = "Production"
  Project     = "SecurityMonitoring"
  Owner       = "SecurityTeam"
}
```

---

## **Outputs**
- `sns_topic_arn`: ARN of the SNS topic for alerts.
- `guardduty_detector_id`: ID of the GuardDuty detector.
- `inspector_assessment_template_arn`: ARN of the Inspector assessment template.
- `iam_role_arn`: ARN of the IAM role for security notifications.

---

## **Logic and Conditions in Modules**
### **GuardDuty Module**
- Automatically disables GuardDuty if `enable` variable is set to `false`.
- Ensures the SNS topic is properly configured before enabling findings publication.

### **Inspector Module**
- Dynamically configures rules packages based on provided variables.
- Skips assessment creation if no rules packages are specified.

### **SNS Module**
- Validates the format of email and phone inputs.
- Ensures at least one subscription (email or SMS) is configured.

### **IAM Module**
- Restricts IAM roles to specific actions and resources using conditions.
- Dynamically generates policies based on module inputs.

### **CloudWatch Module**
- Configures alarms only if thresholds are provided.
- Dynamically adjusts metrics and dimensions based on service (GuardDuty/Inspector).

---

## **Best Practices**
- Use an encrypted S3 bucket to store Terraform state.
- Enable versioning and MFA Delete for S3 state bucket.
- Regularly review and update IAM policies.
- Test modules in a non-production environment before deploying.

---

## **License**
This project is licensed under the MIT License. See the LICENSE file for details.

---

## **Contributing**
Contributions are welcome! Please submit a pull request or open an issue for discussion.

---

## **Support**
For issues or questions, contact the Security Team at security-team@example.com.

