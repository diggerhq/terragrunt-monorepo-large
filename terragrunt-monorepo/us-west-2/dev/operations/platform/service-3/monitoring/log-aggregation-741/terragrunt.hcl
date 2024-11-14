include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/platform/service-1/network/route-table-183",
    "../../../../../../../../us-east-1/dev/finance/data/service-3/storage/rds-573",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-3/compute/batch-801",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-3/network/nacl-762",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-741?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-741"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}