include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/application/service-2/network/transit-gateway-556",
    "../../../../../../../../us-west-2/staging/finance/platform/service-1/monitoring/trace-collection-726",
    "../../../../../../../../us-west-2/qa/operations/application/service-1/monitoring/log-aggregation-727",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-2/application/load-balancer-109",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//spot-fleet-637?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "spot-fleet-637"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}