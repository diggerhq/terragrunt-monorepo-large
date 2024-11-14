include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/application/service-2/storage/rds-400",
    "../../../../../../../../us-east-1/qa/finance/platform/service-3/storage/s3-895",
    "../../../../../../../../us-west-2/qa/finance/data/service-3/monitoring/alertmanager-733",
    "../../../../../../../../eu-west-1/qa/operations/data/service-1/application/cache-layer-261",
    "../../../../../../../../us-east-1/staging/finance/platform/service-2/security/waf-295",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//lambda-155?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "lambda-155"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}