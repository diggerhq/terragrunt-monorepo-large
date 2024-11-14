include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/platform/service-1/monitoring/log-aggregation-513",
    "../../../../../../../../us-east-1/staging/operations/platform/service-3/monitoring/cloudwatch-41",
    "../../../../../../../../us-east-1/qa/marketing/application/service-1/monitoring/log-aggregation-265",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//iam-671?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "iam-671"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}