include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-1/application/api-gateway-792",
    "../../../../../../../../us-west-2/qa/finance/platform/service-3/security/shield-480",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-3/monitoring/prometheus-419",
    "../../../../../../../../us-west-2/staging/operations/platform/service-1/network/vpc-104",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-1/application/api-gateway-24",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cloudwatch-941?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cloudwatch-941"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}