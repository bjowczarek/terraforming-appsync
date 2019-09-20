variable "profile" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "project_name" {
  type = string
}

variable "db_tables" {}

locals {
  env = "dev"
}

provider "aws" {
  region                  = var.aws_region
  shared_credentials_file = "~/.aws/credentials"
  profile                 = var.profile
}

module "appsync" {
  source        = "../modules/appsync"
  env           = local.env
  project_name  = var.project_name
  
}

module "dynamo" {
  source        = "../modules/dynamo"
  env           = local.env
  db_tables = var.db_tables
}

output "apiID" {
  value = module.appsync.apiID
}

output "apiENDPOINT" {
  value = module.appsync.apiENDPOINT
}

output "apiKEY" {
  value = module.appsync.apiKEY
}

