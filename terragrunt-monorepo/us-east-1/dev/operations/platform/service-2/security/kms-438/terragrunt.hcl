include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/data/service-3/storage/rds-809",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-2/storage/fsx-325",
    "../../../../../../../../us-east-1/dev/operations/application/service-1/compute/auto-scaling-806",
    "../../../../../../../../eu-west-1/qa/finance/data/service-3/monitoring/trace-collection-86",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//kms-438?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "kms-438"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}