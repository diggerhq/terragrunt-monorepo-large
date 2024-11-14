include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/application/service-1/monitoring/trace-collection-622",
    "../../../../../../../../us-east-1/dev/operations/data/service-1/network/route-table-231",
    "../../../../../../../../us-east-1/dev/finance/data/service-3/monitoring/log-aggregation-435",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-1/storage/backup-867",
    "../../../../../../../../us-east-1/qa/marketing/application/service-1/application/cache-layer-359",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//lambda-599?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "lambda-599"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}