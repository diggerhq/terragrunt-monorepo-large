include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/application/service-2/application/event-bus-158",
    "../../../../../../../../us-east-1/dev/operations/data/service-2/security/shield-890",
    "../../../../../../../../us-east-1/staging/finance/application/service-2/security/kms-591",
    "../../../../../../../../us-west-2/staging/operations/platform/service-3/monitoring/grafana-946",
    "../../../../../../../../us-east-1/staging/finance/platform/service-3/network/vpn-451",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-640?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-640"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}