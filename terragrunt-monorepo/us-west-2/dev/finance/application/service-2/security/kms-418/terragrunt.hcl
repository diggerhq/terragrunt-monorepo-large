include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/data/service-1/storage/fsx-901",
    "../../../../../../../../us-west-2/qa/marketing/application/service-3/storage/elasticache-652",
    "../../../../../../../../us-east-1/dev/operations/platform/service-3/monitoring/trace-collection-692",
    "../../../../../../../../us-west-2/staging/finance/data/service-3/storage/rds-895",
    "../../../../../../../../us-east-1/dev/finance/data/service-1/monitoring/trace-collection-538",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//kms-418?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "kms-418"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}