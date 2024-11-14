include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/application/service-3/network/subnet-958",
    "../../../../../../../../us-east-1/qa/finance/platform/service-2/security/waf-640",
    "../../../../../../../../eu-west-1/qa/operations/data/service-1/monitoring/log-aggregation-535",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-1/security/waf-481",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-3/storage/elasticache-712",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//backup-937?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "backup-937"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}