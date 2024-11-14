include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/platform/service-2/compute/auto-scaling-443",
    "../../../../../../../../us-east-1/staging/finance/data/service-2/monitoring/trace-collection-780",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-1/network/nacl-496",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-1/storage/redshift-222",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//rds-557?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "rds-557"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}