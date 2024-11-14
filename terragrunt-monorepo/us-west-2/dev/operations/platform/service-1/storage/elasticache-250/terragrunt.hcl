include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/data/service-2/security/shield-148",
    "../../../../../../../../us-east-1/dev/operations/data/service-2/network/subnet-768",
    "../../../../../../../../eu-west-1/staging/operations/application/service-1/storage/backup-86",
    "../../../../../../../../us-east-1/dev/operations/data/service-2/application/event-bus-451",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//elasticache-250?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "elasticache-250"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}