include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/application/service-1/network/route-table-714",
    "../../../../../../../../eu-west-1/qa/finance/application/service-3/application/api-gateway-550",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-1/application/event-bus-151",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-2/monitoring/grafana-184",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-874?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-874"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}