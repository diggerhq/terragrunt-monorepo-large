include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/data/service-2/compute/auto-scaling-650",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-1/application/queue-396",
    "../../../../../../../../us-east-1/qa/finance/platform/service-1/network/subnet-975",
    "../../../../../../../../eu-west-1/qa/finance/application/service-1/application/load-balancer-65",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//prometheus-392?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "prometheus-392"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}