include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git::git@github.com/example/api_8_0_2.git?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "api_8_0_2"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    Environment = local.env_vars.locals.environment
    Region = local.region_vars.locals.aws_region
    ManagedBy = "terragrunt"
  }
}