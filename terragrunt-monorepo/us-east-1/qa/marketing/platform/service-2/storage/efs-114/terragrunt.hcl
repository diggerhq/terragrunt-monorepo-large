include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/platform/service-1/application/load-balancer-927",
    "../../../../../../../../us-east-1/staging/finance/application/service-1/compute/spot-fleet-637",
    "../../../../../../../../eu-west-1/dev/finance/application/service-2/network/vpc-349",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-2/storage/redshift-167",
    "../../../../../../../../us-east-1/qa/operations/data/service-3/security/certificates-948",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//efs-114?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "efs-114"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}