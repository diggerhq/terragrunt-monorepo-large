include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/data/service-3/network/direct-connect-170",
    "../../../../../../../../us-east-1/staging/operations/platform/service-2/storage/dynamodb-82",
    "../../../../../../../../us-west-2/staging/operations/platform/service-1/application/service-mesh-143",
    "../../../../../../../../us-east-1/dev/finance/data/service-1/storage/rds-459",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//backup-146?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "backup-146"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}