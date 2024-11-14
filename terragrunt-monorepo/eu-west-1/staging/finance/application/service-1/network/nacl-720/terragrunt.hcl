include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/application/service-2/application/cache-layer-61",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-3/storage/elasticache-624",
    "../../../../../../../../us-east-1/qa/finance/platform/service-3/monitoring/log-aggregation-889",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//nacl-720?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "nacl-720"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}