include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/data/service-3/network/vpc-237",
    "../../../../../../../../us-east-1/qa/finance/platform/service-3/monitoring/log-aggregation-889",
    "../../../../../../../../eu-west-1/staging/finance/application/service-3/network/direct-connect-622",
    "../../../../../../../../eu-west-1/staging/finance/application/service-2/network/route-table-834",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//secrets-798?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "secrets-798"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}