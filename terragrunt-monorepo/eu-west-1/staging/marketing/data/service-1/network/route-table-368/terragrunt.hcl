include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/platform/service-2/monitoring/alertmanager-791",
    "../../../../../../../../us-east-1/staging/marketing/data/service-3/network/subnet-440",
    "../../../../../../../../us-east-1/staging/finance/platform/service-1/monitoring/trace-collection-898",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-1/application/cache-layer-935",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-1/network/subnet-279",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//route-table-368?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "route-table-368"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}