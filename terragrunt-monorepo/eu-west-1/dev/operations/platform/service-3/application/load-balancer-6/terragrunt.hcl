include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/application/service-1/security/waf-162",
    "../../../../../../../../us-east-1/dev/marketing/data/service-3/network/transit-gateway-761",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-2/application/load-balancer-109",
    "../../../../../../../../us-east-1/qa/finance/platform/service-3/compute/spot-fleet-841",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-6?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-6"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}