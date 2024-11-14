include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/application/service-2/network/endpoint-698",
    "../../../../../../../../eu-west-1/staging/finance/data/service-2/network/transit-gateway-349",
    "../../../../../../../../eu-west-1/qa/finance/data/service-3/monitoring/alertmanager-314",
    "../../../../../../../../eu-west-1/qa/operations/data/service-1/compute/spot-fleet-70",
    "../../../../../../../../us-east-1/staging/finance/application/service-1/application/event-bus-168",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-923?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-923"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}