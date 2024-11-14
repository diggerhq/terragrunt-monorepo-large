include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/data/service-2/storage/redshift-90",
    "../../../../../../../../us-east-1/qa/operations/application/service-3/storage/backup-523",
    "../../../../../../../../us-west-2/staging/operations/data/service-3/storage/dynamodb-150",
    "../../../../../../../../eu-west-1/qa/operations/data/service-1/storage/rds-452",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//elasticache-440?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "elasticache-440"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}