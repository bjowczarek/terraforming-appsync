# Sample Terraform Appsync deployment

After some playings with Amplify CLI for Appsync env provisioning, I'm trying to compare it with Terraform's (0.12) brand new AWS provider version containing appsync related resources.

## ideas

- Older AWS provider versions didn't full suported Appsync: `https://tech.ovoenergy.com/deploying-appsync-with-terraform/` , `https://github.com/SketchingDev/terraform-appsync-demo`
- However now all those steps could be done without additional scripting: `https://www.terraform.io/docs/providers/aws/r/appsync_graphql_api.html`
