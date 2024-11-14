include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/platform/service-1/monitoring/trace-collection-149",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-2/monitoring/log-aggregation-16",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-3/compute/batch-130",
    "../../../../../../../../us-west-2/qa/operations/application/service-1/network/route-table-545",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//direct-connect-27?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "direct-connect-27"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}