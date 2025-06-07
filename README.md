# Terraform + Ansible Project: Automated NGINX Deployment on AWS EC2

## Overview

This project provisions an AWS EC2 instance using **Terraform**, configures it with **NGINX** using **Ansible**, and dynamically generates the inventory file using a shell script — removing the need to hardcode IP addresses.


---

## 🛠️ Tech Stack
- **Terraform**: Infrastructure provisioning
- **Ansible**: Server configuration
- **AWS EC2 (Ubuntu)**: Target host
- **NGINX**: Web server

---

## 📁 Project Structure
```
terraform-ansible-project/
├── generate_inventory.sh        # Script to fetch IP from Terraform and generate Ansible inventory
├── terraform/
│   ├── main.tf                  # Terraform configuration
│   ├── variables.tf             # Terraform input variables
│   ├── outputs.tf               # Terraform output definitions
│   ├── instance_ip.txt          # Instance IP stored from Terraform output
│   └── hosts                    # Generated Ansible inventory
├── ansible/
│   └── setup-nginx.yml          # Ansible playbook to install and configure NGINX
├── README.md                    # Project documentation
```
---

## Steps to Deploy

### 1️⃣ Prerequisites
- AWS CLI configured
- Terraform installed
- Ansible installed
- SSH key pair
- `chmod +x generate_inventory.sh` to make script executable

### 2️⃣ Terraform: Provision Infrastructure
Navigate into the `terraform/` directory:
```bash
cd terraform
terraform init
terraform apply
```
### 3️⃣ Ansible: Configure the Server
```
sh generate_inventory.sh
ansible-playbook -i ../terraform/hosts ansible/setup-nginx.yml --key-file /Path/to/your/KeyPair
```
### 🌐 Access Your App
Once deployed, visit:
```http://<EC2_PUBLIC_IP>```

### Clean Up

To destroy the infrastructure:
```
cd terraform
terraform destroy
```
