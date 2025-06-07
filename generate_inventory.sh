#!/bin/bash

# Go inside terraform folder
cd terraform/

# Step 1: Fetch the public IP from Terraform output and save it to a file
terraform output -raw instance_ip > instance_ip.txt

# Step 2: Start writing a new inventory file for Ansible
echo "[web]" > hosts

# Step 3: Read the IP from the file and append it to the hosts file
ip=$(cat instance_ip.txt)

# Step 4: Write the IP and SSH user info (adjust the user based on AMI you're using)
echo "$ip ansible_user=ubuntu" >> hosts
