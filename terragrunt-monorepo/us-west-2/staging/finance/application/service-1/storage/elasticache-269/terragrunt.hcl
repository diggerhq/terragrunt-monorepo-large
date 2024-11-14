include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/data/service-2/compute/auto-scaling-775",
    "../../../../../../../../us-east-1/dev/finance/application/service-2/application/event-bus-905",
    "../../../../../../../../us-east-1/dev/finance/platform/service-1/compute/batch-626",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-2/compute/batch-116",
    "../../../../../../../../us-west-2/qa/operations/platform/service-1/network/route-table-25",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//elasticache-269?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "elasticache-269"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}