# AWS Production Infrastructure with Terraform

## Overview

This project demonstrates how to build a production-inspired AWS infrastructure using Terraform following Infrastructure as Code (IaC) best practices.

The infrastructure includes networking, compute, database, load balancing, auto scaling, monitoring, IAM, encryption, and CI/CD automation.

## Architecture

The infrastructure will include:

- Custom VPC
- Public & Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables
- Security Groups
- Application Load Balancer
- Auto Scaling Group
- EC2 Application Servers
- Amazon RDS MySQL
- IAM Roles
- CloudWatch
- KMS Encryption
- GitHub Actions
- Multi-Environment (Dev & Prod)

## Project Structure

```text
.
├── environments/
│   ├── dev/
│   └── prod/
├── modules/
├── docs/
├── scripts/
├── .github/
│   └── workflows/
├── README.md
├── LICENSE
└── .gitignore
```

## Project Status

🚧 In Progress
