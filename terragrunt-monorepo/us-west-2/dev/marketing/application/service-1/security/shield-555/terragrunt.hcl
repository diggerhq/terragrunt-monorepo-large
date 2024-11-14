include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/platform/service-2/storage/rds-612",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-1/application/load-balancer-436",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-3/network/vpn-724",
    "../../../../../../../../eu-west-1/dev/finance/data/service-2/compute/eks-532",
    "../../../../../../../../us-east-1/staging/operations/platform/service-1/security/kms-757",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//shield-555?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "shield-555"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}