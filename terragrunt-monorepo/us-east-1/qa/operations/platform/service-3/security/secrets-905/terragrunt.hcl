include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/data/service-3/network/transit-gateway-497",
    "../../../../../../../../us-west-2/staging/marketing/data/service-3/storage/rds-38",
    "../../../../../../../../eu-west-1/qa/finance/application/service-3/network/endpoint-430",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-3/monitoring/prometheus-506",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//secrets-905?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "secrets-905"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}