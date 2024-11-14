include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/application/service-3/storage/elasticache-910",
    "../../../../../../../../us-west-2/staging/marketing/data/service-2/security/secrets-991",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-1/security/shield-659",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-1/monitoring/log-aggregation-395",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//nacl-361?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "nacl-361"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}