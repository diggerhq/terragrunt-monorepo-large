include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/platform/service-2/storage/rds-309",
    "../../../../../../../../us-west-2/staging/marketing/application/service-2/application/service-mesh-67",
    "../../../../../../../../eu-west-1/qa/finance/application/service-1/compute/batch-38",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-1/network/route-table-225",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//efs-574?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "efs-574"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}