include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/data/service-2/network/vpc-479",
    "../../../../../../../../us-west-2/staging/operations/data/service-3/monitoring/log-aggregation-10",
    "../../../../../../../../us-west-2/qa/operations/data/service-3/network/subnet-767",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-1/compute/auto-scaling-781",
    "../../../../../../../../us-east-1/staging/finance/platform/service-2/storage/backup-314",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cloudwatch-168?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cloudwatch-168"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}