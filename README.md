# Automating Creating your AWS VPC Using Terraform

This project automates the creation of an AWS Virtual Private Cloud (VPC) using Terraform. It provides a reusable and configurable infrastructure-as-code template to spin up a secure and scalable VPC environment quickly.

## 📌 Features

- Create a custom VPC
- Configure public and private subnets
- Create route tables and internet gateway
- Optionally configure NAT Gateway and security groups
- Scalable and modular Terraform code

---

## 🧰 Prerequisites

Before using this project, ensure you have the following installed:

- [Terraform](https://www.terraform.io/downloads)
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- An AWS Account with credentials configured (`~/.aws/credentials`)

---

## 🔧 Setup Instructions

1. **Clone the repository**

```bash
git clone https://github.com/your-username/automating-aws-vpc-terraform.git
cd automating-aws-vpc-terraform
