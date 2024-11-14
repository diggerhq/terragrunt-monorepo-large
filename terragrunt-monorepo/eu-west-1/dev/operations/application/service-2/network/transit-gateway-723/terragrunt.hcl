include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/data/service-3/storage/efs-326",
    "../../../../../../../../us-east-1/staging/marketing/application/service-2/network/route-table-807",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-2/network/vpc-19",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-3/security/shield-98",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//transit-gateway-723?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "transit-gateway-723"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}