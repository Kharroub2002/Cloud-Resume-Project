# AWS Cloud Resume Challenge

This repository contains the source code and Infrastructure as Code (IaC) for my personal portfolio website, deployed entirely on Amazon Web Services (AWS).

## 🏗️ Architecture
- **Frontend**: HTML5, CSS3 (Modern Glassmorphism Design)
- **Infrastructure**: Terraform
- **Hosting**: Amazon S3 (Static Website Hosting)

## 📂 Project Structure
- `/Website`: Contains the frontend source code (`index.html`, `style.css`).
- `/Infrastructure`: Contains the Terraform configuration files used to provision the AWS resources.

## 🚀 Deployment
The infrastructure was provisioned using the following Terraform commands:
1. `terraform init`
2. `terraform plan`
3. `terraform apply`

The frontend was deployed using the AWS CLI:
```bash
aws s3 sync ./Website s3://<your-bucket-name>
```
