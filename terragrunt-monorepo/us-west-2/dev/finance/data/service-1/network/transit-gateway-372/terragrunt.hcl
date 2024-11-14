include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/platform/service-3/monitoring/prometheus-223",
    "../../../../../../../../us-east-1/qa/operations/data/service-2/application/load-balancer-736",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-3/application/event-bus-744",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//transit-gateway-372?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "transit-gateway-372"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}