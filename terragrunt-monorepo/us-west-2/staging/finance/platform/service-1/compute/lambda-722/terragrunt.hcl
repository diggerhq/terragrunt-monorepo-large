include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/application/service-2/storage/dynamodb-670",
    "../../../../../../../../eu-west-1/dev/operations/application/service-2/monitoring/log-aggregation-190",
    "../../../../../../../../us-west-2/staging/marketing/application/service-2/application/cache-layer-9",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//lambda-722?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "lambda-722"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}