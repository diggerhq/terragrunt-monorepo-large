include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/platform/service-3/monitoring/prometheus-896",
    "../../../../../../../../us-east-1/staging/marketing/data/service-1/network/endpoint-234",
    "../../../../../../../../eu-west-1/qa/finance/data/service-2/compute/auto-scaling-366",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-774?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-774"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}