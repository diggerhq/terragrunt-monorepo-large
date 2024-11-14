include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/platform/service-1/network/nacl-339",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-3/network/route-table-163",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-1/compute/auto-scaling-125",
    "../../../../../../../../us-east-1/staging/marketing/application/service-2/storage/dynamodb-159",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//backup-991?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "backup-991"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}