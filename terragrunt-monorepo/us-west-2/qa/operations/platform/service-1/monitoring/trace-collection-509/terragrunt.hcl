include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/data/service-2/compute/auto-scaling-75",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-2/monitoring/alertmanager-776",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-1/network/transit-gateway-738",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-509?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-509"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}