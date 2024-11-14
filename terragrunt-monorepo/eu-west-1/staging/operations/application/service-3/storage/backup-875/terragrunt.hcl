include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/data/service-2/storage/s3-622",
    "../../../../../../../../us-east-1/qa/finance/platform/service-3/monitoring/prometheus-315",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-2/network/endpoint-650",
    "../../../../../../../../eu-west-1/staging/finance/application/service-2/network/route-table-834",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//backup-875?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "backup-875"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}