include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/data/service-2/compute/auto-scaling-613",
    "../../../../../../../../us-west-2/qa/finance/application/service-2/security/iam-834",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-2/application/event-bus-394",
    "../../../../../../../../eu-west-1/qa/finance/data/service-3/monitoring/trace-collection-86",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-72?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-72"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}