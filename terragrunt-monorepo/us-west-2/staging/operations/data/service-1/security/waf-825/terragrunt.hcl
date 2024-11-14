include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/application/service-2/security/waf-565",
    "../../../../../../../../us-east-1/qa/finance/application/service-3/monitoring/log-aggregation-277",
    "../../../../../../../../eu-west-1/staging/operations/application/service-2/network/subnet-52",
    "../../../../../../../../us-east-1/qa/finance/platform/service-2/security/waf-640",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//waf-825?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "waf-825"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}