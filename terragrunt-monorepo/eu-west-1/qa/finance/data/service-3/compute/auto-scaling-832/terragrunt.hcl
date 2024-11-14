include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/platform/service-1/monitoring/log-aggregation-390",
    "../../../../../../../../eu-west-1/dev/finance/application/service-1/security/iam-353",
    "../../../../../../../../eu-west-1/qa/finance/data/service-3/application/service-mesh-415",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-2/network/route-table-620",
    "../../../../../../../../us-west-2/qa/finance/data/service-1/application/event-bus-835",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-832?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-832"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}