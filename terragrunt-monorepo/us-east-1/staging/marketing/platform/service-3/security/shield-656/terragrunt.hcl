include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/application/service-3/storage/rds-537",
    "../../../../../../../../us-west-2/dev/operations/data/service-2/application/queue-206",
    "../../../../../../../../us-west-2/staging/marketing/data/service-2/storage/rds-901",
    "../../../../../../../../us-west-2/dev/marketing/data/service-1/network/nacl-48",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//shield-656?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "shield-656"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}