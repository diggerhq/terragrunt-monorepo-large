include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/data/service-3/storage/dynamodb-596",
    "../../../../../../../../eu-west-1/qa/finance/data/service-2/application/event-bus-311",
    "../../../../../../../../us-east-1/staging/operations/application/service-3/storage/rds-537",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-1/storage/dynamodb-303",
    "../../../../../../../../us-east-1/dev/operations/data/service-2/storage/dynamodb-470",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//endpoint-333?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "endpoint-333"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}