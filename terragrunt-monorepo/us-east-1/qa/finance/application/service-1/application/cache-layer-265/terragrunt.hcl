include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/data/service-3/application/service-mesh-293",
    "../../../../../../../../us-west-2/qa/finance/platform/service-1/network/subnet-164",
    "../../../../../../../../us-west-2/staging/operations/application/service-1/application/service-mesh-752",
    "../../../../../../../../us-west-2/staging/operations/platform/service-1/monitoring/prometheus-123",
    "../../../../../../../../us-east-1/qa/operations/platform/service-3/network/transit-gateway-277",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-265?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-265"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}