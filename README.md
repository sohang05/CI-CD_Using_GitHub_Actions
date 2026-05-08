# CI/CD Pipeline for a Web Application using GitHub Actions, Terraform & AWS ECS

## 🚀 Project Overview

This project demonstrates a production-style CI/CD pipeline for a containerized Flask web application using:

* GitHub Actions for CI/CD automation
* Docker for containerization
* Amazon ECR for image storage
* Amazon ECS Fargate for container orchestration
* Application Load Balancer (ALB) for traffic routing
* Terraform for Infrastructure as Code (IaC)
* S3 + DynamoDB for Terraform remote backend and state locking
* Git branching strategy for controlled deployments
* ECS deployment circuit breaker for automatic rollback

The pipeline automatically:

1. Builds a Docker image
2. Tags the image using Git commit SHA
3. Pushes the image to Amazon ECR
4. Updates ECS task definition
5. Deploys a new ECS revision
6. Automatically rolls back on deployment failure

---

# 🏗️ Architecture

```text
Developer Push
      ↓
GitHub Repository
      ↓
GitHub Actions CI/CD
      ↓
Docker Build
      ↓
Amazon ECR
      ↓
Amazon ECS Fargate
      ↓
Application Load Balancer
      ↓
Users
```

---

# ☁️ AWS Services Used

| Service         | Purpose                     |
| --------------- | --------------------------- |
| ECS Fargate     | Run containers serverlessly |
| ECR             | Store Docker images         |
| ALB             | Route traffic to ECS tasks  |
| CloudWatch Logs | Container logging           |
| VPC             | Networking                  |
| IAM             | Permissions                 |
| S3              | Terraform remote state      |
| DynamoDB        | Terraform state locking     |

---

# 📁 Project Structure

```text
CI-CD_Using_GitHub_Actions/
│
├── app/
│   ├── app.py
│   ├── requirements.txt
│   └── Dockerfile
│
├── terraform/
│   ├── main.tf
│   ├── provider.tf
│   ├── variables.tf
│   ├── terraform.tfvars
│   │
│   └── modules/
│       ├── ecs/
│       └── networking/
│
├── .github/
│   └── workflows/
│       └── ci-cd.yml
│
└── README.md
```

---

# ⚙️ Infrastructure Provisioning with Terraform

Terraform is used to provision:

* VPC
* Public subnets
* Internet Gateway
* Route Tables
* Security Groups
* Application Load Balancer
* ECS Cluster
* ECS Task Definition
* ECS Service
* CloudWatch Logs

## Terraform Commands

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

---

# 🔐 Terraform Remote Backend

Terraform state is stored remotely using:

* Amazon S3 bucket for state storage
* DynamoDB table for state locking

Benefits:

* Team collaboration
* Prevent state corruption
* Secure centralized state management
* Production-ready infrastructure workflow

---

# 🐳 Dockerization

The Flask application is containerized using Docker.

## Build Image Locally

```bash
docker build -t flask-app .
```

## Run Container Locally

```bash
docker run -p 5000:5000 flask-app
```

---

# 🔄 GitHub Actions CI/CD Pipeline

The CI/CD pipeline is triggered automatically on pushes to the `develop` branch.

## Pipeline Workflow

```text
Git Push
   ↓
GitHub Actions
   ↓
Build Docker Image
   ↓
Tag Image with Git SHA
   ↓
Push Image to Amazon ECR
   ↓
Render ECS Task Definition
   ↓
Deploy New ECS Revision
   ↓
Automatic Rollback on Failure
```

---

# 🧠 Git Branching Strategy

This project follows a simplified Git Flow workflow.

## Branches

| Branch    | Purpose                        |
| --------- | ------------------------------ |
| main      | Production-ready stable code   |
| develop   | Integration and testing branch |
| feature/* | Individual feature development |

## Workflow

```text
feature branch
      ↓
develop
      ↓
main
```

---

# 🚀 Deployment Process

## CI/CD Steps

1. Developer pushes code to GitHub
2. GitHub Actions workflow starts
3. Docker image is built
4. Image is tagged with Git SHA
5. Image is pushed to Amazon ECR
6. ECS task definition is updated
7. ECS deploys a new revision
8. ALB routes traffic to healthy containers

---

# 🔁 Rollback Strategy

## Manual Rollback

Previous ECS task definition revisions can be redeployed directly from the ECS console.

## Automatic Rollback

ECS Deployment Circuit Breaker is enabled.

If:

* container crashes
* health checks fail
* deployment becomes unhealthy

Then ECS automatically:

```text
Stops failed deployment
      ↓
Restores previous stable deployment
```

This ensures high availability and deployment safety.

---

# 📸 Suggested Screenshots for GitHub

Add screenshots for:

* GitHub Actions successful pipeline
* ECS service deployments
* ALB target health
* ECR image versions
* Terraform apply output
* Application running in browser
* Automatic rollback deployment failure

---

# 🔒 Security Best Practices Implemented

* AWS credentials stored in GitHub Secrets
* No hardcoded passwords or URLs
* Terraform state excluded using `.gitignore`
* Remote Terraform backend enabled
* IAM roles used for ECS execution
* Container images versioned using immutable SHA tags

---

# 📈 Future Improvements

Potential enhancements:

* HTTPS using ACM certificates
* Blue/Green deployments using CodeDeploy
* Multi-environment deployments (dev/stage/prod)
* Terraform CI validation pipeline
* Monitoring dashboards with CloudWatch/Grafana
* Slack deployment notifications

---

# 🧪 Local Development

## Clone Repository

```bash
git clone <your-repo-url>
cd CI-CD_Using_GitHub_Actions
```

## Run Flask App Locally

```bash
cd app
pip install -r requirements.txt
python app.py
```

---

# 🏆 Key Learnings

This project helped demonstrate:

* Infrastructure as Code (IaC)
* Containerization using Docker
* CI/CD automation using GitHub Actions
* ECS Fargate deployments
* Terraform remote backend setup
* Deployment rollback strategies
* Git branching workflows
* Cloud-native deployment lifecycle
  
---

# 👨‍💻 Author

Sohan Gurav
