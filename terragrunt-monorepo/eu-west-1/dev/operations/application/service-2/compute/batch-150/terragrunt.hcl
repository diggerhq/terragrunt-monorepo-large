include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/application/service-3/network/transit-gateway-805",
    "../../../../../../../../us-east-1/staging/finance/platform/service-1/network/direct-connect-651",
    "../../../../../../../../eu-west-1/staging/operations/data/service-2/monitoring/prometheus-67",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-1/compute/ecs-788",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//batch-150?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "batch-150"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}