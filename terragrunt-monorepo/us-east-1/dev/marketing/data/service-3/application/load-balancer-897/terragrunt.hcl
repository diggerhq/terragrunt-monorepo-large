include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/data/service-2/network/transit-gateway-83",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-3/network/nacl-421",
    "../../../../../../../../eu-west-1/staging/finance/data/service-2/application/api-gateway-126",
    "../../../../../../../../us-east-1/staging/operations/platform/service-1/application/service-mesh-933",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-897?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-897"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}