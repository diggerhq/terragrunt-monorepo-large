include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/platform/service-1/monitoring/trace-collection-183",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-3/storage/elasticache-810",
    "../../../../../../../../us-east-1/dev/operations/data/service-3/network/direct-connect-170",
    "../../../../../../../../us-east-1/qa/operations/application/service-1/network/route-table-660",
    "../../../../../../../../us-west-2/dev/finance/data/service-3/monitoring/alertmanager-817",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//rds-257?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "rds-257"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}