variable "profile" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "project_name" {
  type = string
}

provider "aws" {
  region                  = var.aws_region
  shared_credentials_file = "~/.aws/credentials"
  profile                 = var.profile
}

module "appsync" {
  source        = "../modules/appsync"
  env           = "dev"
  project_name  = var.project_name
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

