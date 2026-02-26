# 🚀 AWS DevOps Automated Deployment Project

## 📌 Objective
This project demonstrates automated provisioning and deployment of a containerized web application on AWS using Terraform and CI/CD practices.

Infrastructure and application deployment are fully automated using GitHub Actions.

---

## ⚙️ Tech Stack
- AWS
- Terraform
- Docker
- GitHub Actions
- Elastic Beanstalk
- Amazon ECR
- S3 & DynamoDB

---

## 📂 Repository Structure

app/ # Application & Dockerfile
terraform/ # Infrastructure as Code
.github/workflows/ # CI/CD pipelines


---

## 🧱 Infrastructure
Terraform provisions:
- VPC & Subnets
- Internet Gateway & Routing
- IAM Roles
- ECR Repository
- S3 Deployment Bucket
- Elastic Beanstalk Environment

Remote state stored in **S3** with **DynamoDB locking**.

---

## 🔄 CI/CD Pipelines

### Infrastructure Pipeline
- Terraform Init
- Validate
- Plan
- Manual Approval
- Apply

### Application Pipeline
- Build Docker Image
- Push Image to ECR
- Upload Deployment Bundle to S3
- Deploy to Elastic Beanstalk

Each deployment creates a new immutable Docker image.

---

## ▶️ Usage

### 1. Configure GitHub Secrets

AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
AWS_REGION
ECR_REPO_URL
S3_BUCKET
EB_APP_NAME
EB_ENV_NAME


### 2. Deploy Infrastructure
Push Terraform changes:

git push


### 3. Deploy Application
Push application updates:

git push


---

## 🌍 Access Application
AWS Console → Elastic Beanstalk → Environment URL

---

## ✅ Key Features
- Infrastructure as Code
- Automated CI/CD
- Immutable Docker Images
- Manual Approval for Infra Changes
- Production-style Deployment

---

**Author:** Rajat Singh