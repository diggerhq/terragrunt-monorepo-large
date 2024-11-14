include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/data/service-1/storage/redshift-852",
    "../../../../../../../../us-west-2/dev/finance/data/service-3/storage/rds-197",
    "../../../../../../../../us-east-1/dev/finance/platform/service-1/monitoring/prometheus-57",
    "../../../../../../../../eu-west-1/qa/operations/data/service-1/compute/batch-952",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//shield-527?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "shield-527"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}