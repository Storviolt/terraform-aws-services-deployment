# Terraform Configuration

## Overview

This repository contains Terraform configurations for provisioning AWS resources.  
The project is organized into two main directories:

- **'main/'**: Contains the primary Terraform configuration files.
- **'excluded/'**: Contains files that are excluded from the main execution.

Additionally, there are '.tf' files for configuring various AWS services.  
- **'provider.tf'**: Contains configuration for the AWS provider.  

- **'ec2.tf'**: Configures AWS EC2 instances.  

- **'elb.tf'**: Configures AWS Elastic Load Balancer (ELB).  

- **'rds.tf'**: Configures AWS RDS (Relational Database Service) instances.  

- **'s3.tf'**: Configures AWS S3 buckets and objects.  

- **'sg.tf'**: Configures AWS Security Groups.  

## Configuration  

### Create terraform.tfvars  

"terraform.tfvars.example" provides example values for variables.  
Copy this file to terraform.tfvars and edit the values as needed:

"cp terraform.tfvars.example terraform.tfvars"

### AWS Credentials:  

Create a new access key for your AWS user if you haven't already.  
Add the access key and secret key to the terraform.tfvars file for the provider configuration.  
- Go to the AWS Management Console.  
- Navigate to IAM (Identity and Access Management).  
- Select "Users" and choose your user.  
- Under the "Security credentials" tab, create a new access key and secret key.  
- Update your terraform.tfvars file with these credentials.  

## How to use

- **Move to 'main' directory**
- **Use the following Terraform commands:**  
    - *terraform init*  
    - *terraform validate (optional)*  
    - *terraform plan*  
    - *terraform apply*  
