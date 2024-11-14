include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/platform/service-3/monitoring/log-aggregation-250",
    "../../../../../../../../eu-west-1/staging/finance/application/service-1/storage/fsx-520",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-1/compute/auto-scaling-280",
    "../../../../../../../../us-east-1/dev/finance/platform/service-3/network/direct-connect-584",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//endpoint-207?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "endpoint-207"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}