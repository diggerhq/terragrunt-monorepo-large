include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/application/service-2/storage/rds-691",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-1/monitoring/prometheus-163",
    "../../../../../../../../eu-west-1/qa/operations/data/service-2/network/endpoint-816",
    "../../../../../../../../eu-west-1/qa/operations/data/service-3/monitoring/cloudwatch-516",
    "../../../../../../../../us-east-1/qa/operations/application/service-2/storage/dynamodb-132",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//dynamodb-48?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "dynamodb-48"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}