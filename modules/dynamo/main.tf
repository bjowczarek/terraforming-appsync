
variable "env" {
  type = "string"
}

variable "db_tables" {}

resource "aws_dynamodb_table" "basic-dynamodb-table" {
  for_each = var.db_tables
  name           = "${each.key}-${var.env}"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = each.value.PK
  #range_key      = "GameTitle"

  attribute {
    name = each.value.ATTR[0]
    type = "S"
  }

  attribute {
    name = each.value.ATTR[1]
    type = "S"
  }

  attribute {
    name = each.value.ATTR[2]
    type = "S"
  }

  ttl {
    attribute_name = "TimeToExist"
    enabled        = false
  }

  global_secondary_index {
    name               = each.value.GSI.PK
    hash_key           = each.value.GSI.PK
    range_key          = each.value.GSI.SK
    write_capacity     = 10
    read_capacity      = 10
    projection_type    = "INCLUDE"
    non_key_attributes = ["${each.value.ATTR[0]}"]
  }

  tags = {
    Name        = "${each.key}-${var.env}"
    Environment = "${var.env}"
  }
}