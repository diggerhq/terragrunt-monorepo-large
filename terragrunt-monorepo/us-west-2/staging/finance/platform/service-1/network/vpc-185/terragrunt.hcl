include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/platform/service-3/application/load-balancer-992",
    "../../../../../../../../us-east-1/dev/finance/data/service-2/network/transit-gateway-465",
    "../../../../../../../../eu-west-1/qa/finance/data/service-2/compute/auto-scaling-775",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpc-185?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpc-185"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}