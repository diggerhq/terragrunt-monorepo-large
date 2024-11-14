include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/data/service-1/security/waf-752",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-2/application/cache-layer-686",
    "../../../../../../../../us-west-2/dev/finance/data/service-3/monitoring/alertmanager-817",
    "../../../../../../../../us-west-2/staging/operations/application/service-2/network/endpoint-324",
    "../../../../../../../../us-east-1/dev/finance/application/service-2/storage/dynamodb-237",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//lambda-507?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "lambda-507"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}