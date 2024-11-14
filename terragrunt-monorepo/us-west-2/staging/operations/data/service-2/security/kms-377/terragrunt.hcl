include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/application/service-3/compute/spot-fleet-400",
    "../../../../../../../../us-east-1/qa/marketing/data/service-1/storage/rds-643",
    "../../../../../../../../us-west-2/dev/operations/platform/service-2/application/load-balancer-262",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-2/storage/rds-383",
    "../../../../../../../../eu-west-1/staging/finance/data/service-3/storage/dynamodb-654",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//kms-377?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "kms-377"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}