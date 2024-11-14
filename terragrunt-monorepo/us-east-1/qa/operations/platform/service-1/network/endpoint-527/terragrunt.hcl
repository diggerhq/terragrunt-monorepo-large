include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/platform/service-2/network/transit-gateway-703",
    "../../../../../../../../us-west-2/staging/finance/platform/service-3/monitoring/cloudwatch-51",
    "../../../../../../../../eu-west-1/qa/finance/application/service-1/storage/fsx-846",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//endpoint-527?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "endpoint-527"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}