include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/platform/service-2/application/event-bus-322",
    "../../../../../../../../us-west-2/staging/finance/application/service-2/application/load-balancer-297",
    "../../../../../../../../us-west-2/qa/finance/data/service-3/network/transit-gateway-150",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-2/security/waf-410",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-293?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-293"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}