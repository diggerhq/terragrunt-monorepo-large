include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/data/service-2/storage/rds-153",
    "../../../../../../../../us-east-1/staging/finance/application/service-2/application/cache-layer-103",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-1/network/vpc-36",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-3/security/security-hub-728",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-3/compute/batch-960",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//redshift-251?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "redshift-251"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}