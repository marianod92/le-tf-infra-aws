#
# config/backend.config
#
#================================#
# Terraform AWS Backend Settings #
#================================#
variable "region" {
  type        = string
  description = "AWS Region"
}

variable "profile" {
  type        = string
  description = "AWS Profile (required by the backend but also used for other resources)"
}

variable "bucket" {
  type        = string
  description = "AWS S3 TF State Backend Bucket"
}

variable "dynamodb_table" {
  type        = string
  description = "AWS DynamoDB TF Lock state table name"
}

variable "encrypt" {
  type        = bool
  description = "Enable AWS DynamoDB with server side encryption"
}

#
# config/base.config
#
#=============================#
# Project Variables           #
#=============================#
variable "project" {
  type        = string
  description = "Project Name"
}

variable "project_long" {
  type        = string
  description = "Project Long Name"
}

variable "environment" {
  type        = string
  description = "Environment Name"
}

#
# config/extra.config
#
#=============================#
# Accounts & Extra Vars       #
#=============================#
variable "region_secondary" {
  type        = string
  description = "AWS Scondary Region for HA"
}

variable "root_account_id" {
  type        = string
  description = "Account: Root"
}

variable "security_account_id" {
  type        = string
  description = "Account: Security & Users Management"
}

variable "shared_account_id" {
  type        = string
  description = "Account: Shared Resources"
}

variable "network_account_id" {
  type        = string
  description = "Account: Networking Resources"
}

variable "appsdevstg_account_id" {
  type        = string
  description = "Account: Dev Modules & Libs"
}

variable "appsprd_account_id" {
  type        = string
  description = "Account: Prod Modules & Libs"
}

variable "vault_token" {
  type = string
}

variable "vault_address" {
  type = string
}

#=============================#
# ALB BASIC LAYOUT MODULE     #
#=============================#
#
# General
#
variable "prefix" {
  type        = string
  description = "Prefix"
  default     = "infra"
}

#
# ALB Attributes
#

variable "name" {
  type        = string
  description = "Name"
  default     = "eskibana-alb"
}

variable "subnet_id" {
  type        = list(string)
  description = "Set the subnet id for the ALB"
  default     = ["subnet-0c8398a4145991a1b", "subnet-019f820e7fbb5f60c"]
}

variable "vpc_id" {
  type        = string
  description = "Set the vpc id for the ALB"
  default     = "vpc-02ed8f213c7b6d869"
}

variable "access_cidr" {
  type        = list(string)
  description = "Set crds"
  default     = ["172.18.0.0/20", "10.1.0.0/16"]
}

variable "certificate_id" {
  type        = string
  description = "Set the vpc id for the ALB"
  default     = "arn:aws:acm:us-east-1:763606934258:certificate/5d23f8e6-474d-409a-a457-37a858f89dbf"
}