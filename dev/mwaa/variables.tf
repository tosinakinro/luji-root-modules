variable "region" {
  description = "AWS region"
  type        = string
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket for MWAA"
  type        = string
}

variable "iam_role_name" {
  description = "Name of the IAM role for MWAA"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for the subnets"
  type        = list(string)
}

variable "azs" {
  description = "List of availability zones"
  type        = list(string)
}

variable "environment_names" {
  description = "Names of the MWAA environment"
  type        = list(string)
}

variable "airflow_version" {
  description = "Version of Apache Airflow"
  type        = string
}

variable "environment_class" {
  description = "Class of the MWAA environment"
  type        = string
}

variable "webserver_access_mode" {
  description = "Access mode for the MWAA webserver"
  type        = string
}

variable "weekly_maintenance_window_start" {
  description = "Start of the weekly maintenance window"
  type        = string
}

variable "security_group_name" {
  description = "Name of the security group"
  type        = string
}

variable "dag_s3_path" {
  description = "Path to S3 buckets where DAGs are stored"
  type        = string
}

variable "max_workers" {}
variable "role_policy_name" {}
variable "tags" {}
variable "vpc_tags" {}
variable "cloudtrial_name" {}

variable "subnet_ids" {
  default = ["subnet-00336ce01840b9de0","subnet-0d0e4e0703c43e58f"]
}
