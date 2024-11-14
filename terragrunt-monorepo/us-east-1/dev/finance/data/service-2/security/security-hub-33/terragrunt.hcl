include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/application/service-1/network/subnet-210",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-1/security/waf-122",
    "../../../../../../../../eu-west-1/qa/finance/data/service-2/compute/auto-scaling-775",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//security-hub-33?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "security-hub-33"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}