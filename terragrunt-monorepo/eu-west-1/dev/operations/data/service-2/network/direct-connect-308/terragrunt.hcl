include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/application/service-2/network/endpoint-567",
    "../../../../../../../../us-west-2/staging/finance/platform/service-1/application/load-balancer-382",
    "../../../../../../../../us-east-1/qa/operations/platform/service-2/application/event-bus-481",
    "../../../../../../../../us-east-1/qa/finance/data/service-1/network/vpn-109",
    "../../../../../../../../eu-west-1/staging/operations/application/service-1/application/cache-layer-619",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//direct-connect-308?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "direct-connect-308"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}