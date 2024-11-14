include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/platform/service-3/network/endpoint-776",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-1/monitoring/prometheus-240",
    "../../../../../../../../us-east-1/dev/finance/data/service-1/monitoring/alertmanager-985",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-3/monitoring/log-aggregation-888",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//waf-481?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "waf-481"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}