include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/application/service-1/storage/backup-933",
    "../../../../../../../../eu-west-1/dev/operations/data/service-1/network/route-table-500",
    "../../../../../../../../us-west-2/dev/finance/platform/service-3/security/iam-926",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-1/compute/batch-208",
    "../../../../../../../../us-west-2/dev/finance/application/service-3/application/event-bus-22",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-600?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-600"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}