include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/application/service-2/monitoring/cloudwatch-438",
    "../../../../../../../../us-east-1/staging/marketing/application/service-3/compute/spot-fleet-891",
    "../../../../../../../../us-west-2/qa/operations/data/service-2/monitoring/log-aggregation-761",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//backup-856?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "backup-856"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}