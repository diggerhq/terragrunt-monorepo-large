include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/application/service-1/security/kms-841",
    "../../../../../../../../us-west-2/qa/finance/data/service-2/network/subnet-395",
    "../../../../../../../../eu-west-1/dev/finance/application/service-3/storage/efs-378",
    "../../../../../../../../eu-west-1/qa/operations/application/service-2/compute/spot-fleet-173",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-1/storage/backup-867",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//endpoint-541?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "endpoint-541"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}