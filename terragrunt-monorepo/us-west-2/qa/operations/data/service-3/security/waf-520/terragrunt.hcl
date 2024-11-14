include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/application/service-3/security/shield-23",
    "../../../../../../../../us-west-2/staging/operations/data/service-2/monitoring/prometheus-784",
    "../../../../../../../../us-east-1/dev/marketing/data/service-1/security/guardduty-138",
    "../../../../../../../../us-east-1/qa/finance/data/service-1/security/iam-118",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-2/network/subnet-831",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//waf-520?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "waf-520"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}