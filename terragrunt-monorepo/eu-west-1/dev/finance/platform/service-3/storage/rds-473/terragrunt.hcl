include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/application/service-1/storage/fsx-590",
    "../../../../../../../../us-west-2/qa/operations/application/service-3/storage/backup-163",
    "../../../../../../../../us-west-2/staging/operations/platform/service-1/compute/auto-scaling-90",
    "../../../../../../../../us-east-1/dev/operations/application/service-1/network/route-table-856",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//rds-473?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "rds-473"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}