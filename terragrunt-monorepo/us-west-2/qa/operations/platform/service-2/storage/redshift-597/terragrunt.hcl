include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/platform/service-2/application/cache-layer-412",
    "../../../../../../../../us-west-2/qa/operations/platform/service-1/network/vpn-949",
    "../../../../../../../../us-east-1/qa/finance/data/service-2/compute/auto-scaling-398",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-2/monitoring/prometheus-937",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-3/monitoring/grafana-88",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//redshift-597?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "redshift-597"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}