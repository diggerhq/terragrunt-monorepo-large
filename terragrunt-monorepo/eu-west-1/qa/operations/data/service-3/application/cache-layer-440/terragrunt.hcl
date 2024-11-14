include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/application/service-2/storage/rds-400",
    "../../../../../../../../us-east-1/dev/finance/data/service-2/compute/spot-fleet-43",
    "../../../../../../../../us-west-2/qa/operations/data/service-2/storage/efs-330",
    "../../../../../../../../eu-west-1/qa/finance/data/service-1/network/direct-connect-354",
    "../../../../../../../../us-east-1/dev/finance/platform/service-2/storage/s3-933",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-440?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-440"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}