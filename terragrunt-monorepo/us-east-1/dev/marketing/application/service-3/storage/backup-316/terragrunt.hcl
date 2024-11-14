include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/platform/service-2/compute/eks-353",
    "../../../../../../../../us-east-1/dev/operations/data/service-1/storage/redshift-825",
    "../../../../../../../../us-east-1/qa/finance/data/service-1/network/vpn-109",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//backup-316?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "backup-316"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}