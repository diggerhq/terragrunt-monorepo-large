include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/data/service-3/network/subnet-367",
    "../../../../../../../../us-west-2/qa/finance/application/service-3/storage/elasticache-229",
    "../../../../../../../../eu-west-1/dev/operations/data/service-1/monitoring/log-aggregation-280",
    "../../../../../../../../us-east-1/qa/operations/platform/service-2/storage/backup-271",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//lambda-652?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "lambda-652"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}