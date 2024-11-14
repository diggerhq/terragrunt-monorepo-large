include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git::git@github.com/example/queue_1_3_7.git?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue_1_3_7"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    Environment = local.env_vars.locals.environment
    Region = local.region_vars.locals.aws_region
    ManagedBy = "terragrunt"
  }
}