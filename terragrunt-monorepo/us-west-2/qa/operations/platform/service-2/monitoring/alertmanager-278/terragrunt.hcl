include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/data/service-3/monitoring/trace-collection-412",
    "../../../../../../../../us-east-1/qa/operations/platform/service-2/network/direct-connect-904",
    "../../../../../../../../us-west-2/dev/marketing/application/service-3/network/vpn-86",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-278?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-278"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}