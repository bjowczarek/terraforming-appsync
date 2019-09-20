

resource "aws_appsync_graphql_api" "api" {
  name = "${var.project_name}-${var.env}"
  authentication_type = "API_KEY"
  schema = "${file("${path.root}/../templates/appsync/schema.graphql")}"
}

resource "aws_appsync_api_key" "api_key" {
  api_id = "${aws_appsync_graphql_api.api.id}"
  # API keys have a maximum validity period of 365 days
  expires = "2020-01-04T12:00:00Z"
}

