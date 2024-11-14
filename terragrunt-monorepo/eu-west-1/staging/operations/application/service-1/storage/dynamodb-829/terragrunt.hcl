include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/data/service-1/storage/fsx-227",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-3/application/queue-254",
    "../../../../../../../../us-east-1/qa/marketing/application/service-1/monitoring/log-aggregation-587",
    "../../../../../../../../us-east-1/qa/marketing/data/service-3/storage/rds-21",
    "../../../../../../../../eu-west-1/staging/finance/data/service-2/compute/batch-708",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//dynamodb-829?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "dynamodb-829"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}