include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/data/service-3/network/endpoint-498",
    "../../../../../../../../us-west-2/qa/finance/platform/service-2/compute/eks-326",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-2/application/event-bus-201",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-2/network/vpn-283",
    "../../../../../../../../us-west-2/dev/operations/data/service-3/security/secrets-375",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-878?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-878"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}