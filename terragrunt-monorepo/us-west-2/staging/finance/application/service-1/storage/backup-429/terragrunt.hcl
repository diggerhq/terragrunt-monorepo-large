include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/data/service-3/security/kms-496",
    "../../../../../../../../us-east-1/qa/finance/platform/service-3/compute/spot-fleet-841",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-2/storage/rds-383",
    "../../../../../../../../us-west-2/dev/marketing/data/service-2/compute/eks-746",
    "../../../../../../../../us-east-1/qa/operations/application/service-3/network/subnet-551",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//backup-429?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "backup-429"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}