include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/network/direct-connect-763",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-3/monitoring/cloudwatch-572",
    "../../../../../../../../us-east-1/dev/finance/platform/service-1/storage/rds-279",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-629?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-629"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}