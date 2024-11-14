include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/application/service-1/storage/fsx-192",
    "../../../../../../../../us-east-1/staging/operations/application/service-3/network/route-table-671",
    "../../../../../../../../eu-west-1/qa/operations/data/service-2/network/endpoint-816",
    "../../../../../../../../us-east-1/staging/operations/data/service-3/monitoring/cloudwatch-186",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//endpoint-482?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "endpoint-482"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}