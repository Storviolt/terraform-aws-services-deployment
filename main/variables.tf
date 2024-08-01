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
variable "ec2_instances" {
  type = list(object({
    name           = string
    ami            = string
    instance_type  = string
    html_content   = string
  }))
}


# s3.tf
#
variable "s3_buckets" {
  description = "List of S3 buckets to create"
  type        = list(object({
    name = string
  }))
}

# elb.tf
#
variable "elbs" {
  type = list(object({
    name      = string
    instances = list(string)
  }))
}