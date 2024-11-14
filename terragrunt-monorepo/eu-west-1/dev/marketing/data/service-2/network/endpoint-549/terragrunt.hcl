include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/application/service-3/monitoring/log-aggregation-704",
    "../../../../../../../../us-east-1/qa/marketing/data/service-2/application/load-balancer-611",
    "../../../../../../../../us-west-2/staging/finance/data/service-2/application/event-bus-746",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//endpoint-549?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "endpoint-549"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}