# Python-Project

This repository contains the source code for a Python web application and Terraform files for deploying and managing the infrastructure.

## Directory Structure

- **hello-web/:** Contains the source code for the Python web application.
- **python-web/:** Contains Terraform files for deploying the Python app on AWS.

## Python Web Application

The **hello-web/** directory houses the code for our web application. Here's a brief overview:

- **app.py:** Main Python script for the web application.
- **templates/:** Directory for HTML templates used by the web application.
- **requirements.txt:** List of Python dependencies for the application.

## Running the Python App

1. Ensure you have Python installed.
2. Install dependencies: **pip install -r python-code/requirements.txt**
3. Run the app: **python hello-web/app.py**

## Infrastructure Deployment with Terraform

The **python-web/** directory contains Terraform files for deploying the Python app on AWS. Here's an overview:

- **main.tf:** Main Terraform configuration file.
- **variables.tf:** Variables file for defining input variables.
- **outputs.tf:** Outputs file for defining output values.
- **terraform.tfvars:** Example Terraform variables file (remember to keep this secure, add it to the gitignore file).

## Deployment Steps

1. Ensure you have Terraform installed.
2. Navigate to the **python-web/** directory.
3. Initialize Terraform: **terraform init**
4. Plan the deployment: **terraform plan**
5. Apply the changes: **terraform apply**

## Cleanup

To destroy the infrastructure:

1. Navigate to the **python-web/** directory.
2. Run: **terraform destroy**
