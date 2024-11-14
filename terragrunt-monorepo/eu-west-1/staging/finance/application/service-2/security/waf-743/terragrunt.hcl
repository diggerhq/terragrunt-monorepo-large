include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/platform/service-1/security/guardduty-507",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-2/monitoring/cloudwatch-792",
    "../../../../../../../../eu-west-1/staging/operations/data/service-2/network/vpc-479",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//waf-743?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "waf-743"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}