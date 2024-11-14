include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/data/service-2/monitoring/alertmanager-707",
    "../../../../../../../../eu-west-1/qa/operations/application/service-3/application/queue-439",
    "../../../../../../../../us-east-1/dev/marketing/data/service-1/network/route-table-806",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-2/network/vpc-599",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//security-hub-49?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "security-hub-49"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}