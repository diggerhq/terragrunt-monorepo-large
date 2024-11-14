include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/application/service-1/compute/batch-921",
    "../../../../../../../../us-east-1/staging/operations/platform/service-1/storage/s3-966",
    "../../../../../../../../eu-west-1/dev/finance/data/service-3/storage/s3-461",
    "../../../../../../../../us-west-2/qa/finance/data/service-1/network/route-table-124",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-637?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-637"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}