include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/data/service-2/security/shield-702",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-1/monitoring/grafana-124",
    "../../../../../../../../us-west-2/qa/finance/platform/service-3/compute/auto-scaling-611",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-3/monitoring/log-aggregation-888",
    "../../../../../../../../us-west-2/qa/finance/platform/service-1/monitoring/prometheus-179",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//api-gateway-415?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "api-gateway-415"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}