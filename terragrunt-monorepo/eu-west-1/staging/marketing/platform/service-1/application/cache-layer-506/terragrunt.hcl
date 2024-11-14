include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/application/service-1/monitoring/alertmanager-983",
    "../../../../../../../../us-west-2/dev/finance/platform/service-2/network/vpc-330",
    "../../../../../../../../us-east-1/staging/marketing/application/service-3/compute/lambda-523",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-506?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-506"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}