include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/data/service-2/storage/elasticache-734",
    "../../../../../../../../us-west-2/qa/finance/data/service-3/storage/efs-159",
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/monitoring/log-aggregation-436",
    "../../../../../../../../us-west-2/qa/operations/platform/service-3/network/route-table-897",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-538?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-538"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}