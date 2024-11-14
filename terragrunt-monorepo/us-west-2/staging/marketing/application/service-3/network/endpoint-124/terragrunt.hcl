include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/application/service-1/network/transit-gateway-676",
    "../../../../../../../../us-east-1/qa/finance/platform/service-2/compute/batch-381",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-3/security/guardduty-34",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-1/application/api-gateway-667",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-1/storage/redshift-447",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//endpoint-124?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "endpoint-124"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}