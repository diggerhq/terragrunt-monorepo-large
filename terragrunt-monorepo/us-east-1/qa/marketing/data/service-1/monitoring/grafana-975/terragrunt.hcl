include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-3/security/shield-305",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-1/network/subnet-613",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-1/network/direct-connect-296",
    "../../../../../../../../eu-west-1/staging/finance/data/service-3/storage/redshift-869",
    "../../../../../../../../us-east-1/staging/operations/platform/service-1/storage/fsx-41",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-975?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-975"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}