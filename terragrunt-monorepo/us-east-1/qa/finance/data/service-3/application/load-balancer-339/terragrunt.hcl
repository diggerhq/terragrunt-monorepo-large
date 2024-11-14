include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/application/service-3/monitoring/alertmanager-45",
    "../../../../../../../../us-west-2/qa/finance/platform/service-3/network/endpoint-776",
    "../../../../../../../../us-east-1/qa/finance/data/service-3/monitoring/prometheus-597",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-3/compute/auto-scaling-480",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-339?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-339"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}