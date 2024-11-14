include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-2/application/cache-layer-355",
    "../../../../../../../../us-west-2/staging/operations/platform/service-3/compute/batch-995",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-3/storage/fsx-417",
    "../../../../../../../../us-east-1/qa/finance/data/service-3/application/load-balancer-339",
    "../../../../../../../../us-west-2/staging/finance/platform/service-1/network/route-table-77",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//security-hub-160?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "security-hub-160"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}