include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/platform/service-2/network/transit-gateway-772",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-1/monitoring/cloudwatch-755",
    "../../../../../../../../eu-west-1/dev/finance/application/service-3/monitoring/trace-collection-358",
    "../../../../../../../../us-west-2/qa/operations/application/service-1/security/shield-959",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-938?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-938"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}