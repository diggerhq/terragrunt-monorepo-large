include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/application/service-2/security/shield-167",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-1/monitoring/trace-collection-27",
    "../../../../../../../../us-east-1/dev/operations/application/service-2/security/shield-559",
    "../../../../../../../../eu-west-1/qa/operations/data/service-2/application/load-balancer-926",
    "../../../../../../../../us-west-2/dev/finance/application/service-3/compute/batch-253",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-195?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-195"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}