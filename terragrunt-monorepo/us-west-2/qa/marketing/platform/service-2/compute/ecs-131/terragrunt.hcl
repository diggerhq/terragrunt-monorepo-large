include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/platform/service-2/storage/efs-967",
    "../../../../../../../../eu-west-1/staging/finance/application/service-3/monitoring/log-aggregation-981",
    "../../../../../../../../us-east-1/qa/finance/platform/service-3/network/vpc-847",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ecs-131?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ecs-131"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}