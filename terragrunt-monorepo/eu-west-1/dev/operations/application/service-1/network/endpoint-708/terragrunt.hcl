include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/platform/service-2/monitoring/cloudwatch-332",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-3/storage/elasticache-801",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-1/monitoring/log-aggregation-8",
    "../../../../../../../../us-east-1/staging/finance/platform/service-3/storage/s3-36",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//endpoint-708?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "endpoint-708"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}