include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/platform/service-2/security/certificates-406",
    "../../../../../../../../us-east-1/staging/operations/data/service-3/network/subnet-921",
    "../../../../../../../../us-west-2/qa/finance/platform/service-1/application/cache-layer-871",
    "../../../../../../../../eu-west-1/dev/operations/data/service-1/storage/fsx-893",
    "../../../../../../../../us-east-1/staging/finance/application/service-2/monitoring/alertmanager-481",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//rds-602?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "rds-602"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}