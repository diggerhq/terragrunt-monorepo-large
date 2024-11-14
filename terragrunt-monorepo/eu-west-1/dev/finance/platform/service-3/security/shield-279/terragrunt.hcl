include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/platform/service-3/compute/auto-scaling-290",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-3/compute/batch-993",
    "../../../../../../../../us-east-1/staging/operations/application/service-1/storage/fsx-505",
    "../../../../../../../../us-west-2/staging/finance/application/service-3/storage/redshift-822",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-1/network/subnet-279",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//shield-279?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "shield-279"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}