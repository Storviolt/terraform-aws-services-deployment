# main.tf
#
variable "key_name" {
  description = "Name of the key file"
  default = "my_key"
}


# provider.tf
#
variable "aws_region" {
  description = "The AWS region to create resources in"
  type        = string
}
variable "aws_access_key" {
  description = "AWS access key for authentication"
  type        = string
}
variable "aws_secret_key" {
  description = "AWS secret key for authentication"
  type        = string
  sensitive   = true
}


# rds.tf
#
variable "db_username" {
  description = "The username for the RDS instance"
  type        = string
}
variable "db_password" {
  description = "The password for the RDS instance"
  type        = string
  sensitive   = true
}


# ec2.tf
#
variable "first_instance_name" {
  description = "The name for the first EC2 instance"
  type        = string
}
variable "second_instance_name" {
  description = "The name for the second EC2 instance"
  type        = string
}
variable "first_instance_html_content" {
  description = "The HTML content for the first EC2 instance"
  type        = string
}
variable "second_instance_html_content" {
  description = "The HTML content for the second EC2 instance"
  type        = string
}


# s3.tf
#
variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}
variable "file_key" {
  description = "The key for the S3 object"
  type        = string
}
variable "file_source" {
  description = "The source file path for the S3 object"
  type        = string
}
