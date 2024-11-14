include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/platform/service-2/storage/efs-967",
    "../../../../../../../../us-west-2/qa/finance/platform/service-1/security/iam-167",
    "../../../../../../../../us-east-1/qa/marketing/data/service-1/compute/spot-fleet-62",
    "../../../../../../../../us-east-1/staging/operations/data/service-3/network/subnet-921",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-1/storage/rds-332",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//rds-645?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "rds-645"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}