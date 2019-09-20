output "apiID" {
  value = "${aws_appsync_graphql_api.api.id}"
}

output "apiENDPOINT" {
  value = "${aws_appsync_graphql_api.api.uris["GRAPHQL"]}"
}

output "apiKEY" {
  value = "${aws_appsync_api_key.api_key.key}"
}