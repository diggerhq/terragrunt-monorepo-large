include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/platform/service-2/monitoring/log-aggregation-740",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-3/network/vpc-801",
    "../../../../../../../../eu-west-1/dev/finance/application/service-3/application/load-balancer-418",
    "../../../../../../../../us-west-2/qa/operations/application/service-1/storage/fsx-403",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//batch-98?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "batch-98"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}