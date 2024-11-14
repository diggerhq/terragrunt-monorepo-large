include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/data/service-3/monitoring/trace-collection-825",
    "../../../../../../../../us-east-1/dev/marketing/application/service-3/network/route-table-712",
    "../../../../../../../../us-east-1/qa/operations/data/service-1/network/vpn-943",
    "../../../../../../../../us-west-2/dev/operations/platform/service-1/security/waf-624",
    "../../../../../../../../us-west-2/qa/operations/data/service-1/application/event-bus-528",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//api-gateway-367?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "api-gateway-367"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}