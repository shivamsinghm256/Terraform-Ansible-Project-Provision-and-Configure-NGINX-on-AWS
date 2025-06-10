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
│
├── terraform/
│   ├── main.tf                   # Terraform config: infrastructure definition
│   ├── variables.tf              # Terraform input variables
│   ├── outputs.tf                # Terraform output values (e.g., instance IP)
│   ├── hosts                     # Ansible dynamic inventory (generated)
│
├── generate_inventory.sh         # Script to create Ansible inventory from Terraform output
│
├── ansible/
│   └── setup-nginx.yml           # Ansible playbook to configure EC2 (e.g., install NGINX)
│
├── .github/
│   └── workflows/
│       └── ci-cd.yml             # GitHub Actions workflow to run Terraform & Ansible
│
├── .gitignore                    # Ignore state files, private keys, generated files, etc.
└── README.md                     # Project documentation
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
Once deployed, visit: ```http://<EC2_PUBLIC_IP>``` </br>
You should see the page shown below.
![image](https://github.com/user-attachments/assets/241c361b-5e29-4fb7-937d-c3731159be6a)


### Clean Up

To destroy the infrastructure:
```
cd terraform
terraform destroy
```
