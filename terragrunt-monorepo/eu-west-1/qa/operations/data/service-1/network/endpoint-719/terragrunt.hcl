include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/data/service-2/network/subnet-984",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-1/network/vpc-269",
    "../../../../../../../../us-east-1/dev/finance/data/service-3/storage/rds-573",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-2/monitoring/log-aggregation-948",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//endpoint-719?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "endpoint-719"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}