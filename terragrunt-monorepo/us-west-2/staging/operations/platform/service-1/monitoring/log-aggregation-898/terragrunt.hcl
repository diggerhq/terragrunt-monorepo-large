include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/platform/service-3/application/load-balancer-555",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-3/storage/elasticache-713",
    "../../../../../../../../us-east-1/dev/finance/data/service-3/network/route-table-309",
    "../../../../../../../../us-west-2/dev/finance/application/service-1/application/service-mesh-815",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-898?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-898"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}