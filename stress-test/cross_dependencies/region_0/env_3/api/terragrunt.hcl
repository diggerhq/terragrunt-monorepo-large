include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git::git@github.com/example/region_0/env_3/api.git?ref=v1.0.0"
}

dependencies {
  paths = [
    "../region_2/env_3/cache",
    "../region_3/env_3/queue",
    "../region_1/env_1/queue",
    "../region_0/env_2/database",
    "../region_0/env_4/worker",
    "../region_3/env_4/api",
    "../region_3/env_4/queue",
    "../region_1/env_4/database",
    "../region_0/env_1/queue",
    "../region_4/env_1/cache",
    "../region_1/env_1/cache",
    "../region_3/env_2/queue",
    "../region_0/env_0/database",
    "../region_1/env_2/api",
    "../region_3/env_0/worker",
    "../region_0/env_3/web",
    "../region_0/env_3/database",
    "../region_2/env_2/queue",
    "../region_3/env_0/queue",
    "../region_4/env_2/worker",
    "../region_4/env_3/api",
    "../region_2/env_2/api",
    "../region_2/env_0/database",
    "../region_2/env_1/worker",
    "../region_1/env_0/database",
    "../region_4/env_1/database",
    "../region_2/env_2/database",
    "../region_1/env_3/queue",
    "../region_0/env_3/queue",
    "../region_2/env_3/web",
    "../region_0/env_3/cache",
    "../region_2/env_2/cache",
    "../region_1/env_2/worker",
    "../region_2/env_3/worker",
    "../region_4/env_2/api",
    "../region_3/env_2/worker",
    "../region_3/env_2/cache",
    "../region_3/env_2/database",
    "../region_2/env_0/api",
    "../region_0/env_2/worker",
    "../region_1/env_0/cache",
    "../region_2/env_0/queue",
    "../region_3/env_2/api",
    "../region_2/env_1/web",
  ]
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "region_0/env_3/api"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    Environment = local.env_vars.locals.environment
    Region = local.region_vars.locals.aws_region
    ManagedBy = "terragrunt"
  }
}