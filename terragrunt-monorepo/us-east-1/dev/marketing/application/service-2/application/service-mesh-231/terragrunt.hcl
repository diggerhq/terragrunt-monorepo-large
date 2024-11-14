include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/application/service-1/storage/rds-581",
    "../../../../../../../../us-east-1/dev/operations/application/service-3/network/route-table-668",
    "../../../../../../../../us-east-1/staging/marketing/data/service-2/storage/fsx-944",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-231?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-231"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}