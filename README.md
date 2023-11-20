Python-Project

This repository contains the source code for a Python web application and Terraform files for deploying and managing the infrastructure.

Directory Structure

python-code/: Contains the source code for the Python web application.
terraform-code/: Contains Terraform files for deploying the Python app on AWS.

Python Web Application

The python-code/ directory houses the code for our web application. Here's a brief overview:

app.py: Main Python script for the web application.
templates/: Directory for HTML templates used by the web application.
static/: Directory for static assets such as stylesheets and images.
requirements.txt: List of Python dependencies for the application.

Running the Python App

Ensure you have Python installed.
Install dependencies: pip install -r python-code/requirements.txt
Run the app: python python-code/app.py

Infrastructure Deployment with Terraform

The terraform-code/ directory contains Terraform files for deploying the Python app on AWS. Here's an overview:

main.tf: Main Terraform configuration file.
variables.tf: Variables file for defining input variables.
outputs.tf: Outputs file for defining output values.
terraform.tfvars: Example Terraform variables file (remember to keep this secure).

Deployment Steps

Ensure you have Terraform installed.
Navigate to the terraform-code/ directory.
Initialize Terraform: terraform init
Plan the deployment: terraform plan
Apply the changes: terraform apply

Cleanup

To destroy the infrastructure:

Navigate to the terraform-code/ directory.
Run: terraform destroy
