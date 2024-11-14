include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/data/service-2/network/subnet-731",
    "../../../../../../../../us-west-2/qa/marketing/application/service-3/compute/auto-scaling-123",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-1/application/cache-layer-651",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//api-gateway-847?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "api-gateway-847"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}