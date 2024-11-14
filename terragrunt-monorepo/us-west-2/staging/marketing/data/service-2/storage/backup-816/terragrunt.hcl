include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/data/service-3/storage/dynamodb-596",
    "../../../../../../../../eu-west-1/dev/operations/application/service-3/application/cache-layer-60",
    "../../../../../../../../us-west-2/staging/operations/data/service-3/compute/ecs-618",
    "../../../../../../../../us-east-1/qa/marketing/application/service-1/storage/rds-170",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//backup-816?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "backup-816"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}