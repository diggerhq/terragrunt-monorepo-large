include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/data/service-2/application/event-bus-584",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-2/application/cache-layer-686",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-1/security/waf-122",
    "../../../../../../../../eu-west-1/qa/operations/application/service-1/network/transit-gateway-634",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-1/application/load-balancer-862",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-505?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-505"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}