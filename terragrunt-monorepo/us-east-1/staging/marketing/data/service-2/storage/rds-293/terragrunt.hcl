include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/platform/service-3/security/shield-98",
    "../../../../../../../../us-east-1/staging/operations/application/service-3/monitoring/cloudwatch-916",
    "../../../../../../../../us-east-1/dev/marketing/data/service-1/network/route-table-806",
    "../../../../../../../../us-west-2/dev/operations/data/service-3/storage/redshift-524",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//rds-293?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "rds-293"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}