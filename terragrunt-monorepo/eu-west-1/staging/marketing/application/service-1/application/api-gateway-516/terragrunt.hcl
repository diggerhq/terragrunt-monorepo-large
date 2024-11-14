include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/data/service-1/network/vpn-594",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-1/compute/lambda-793",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-1/storage/dynamodb-29",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//api-gateway-516?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "api-gateway-516"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}