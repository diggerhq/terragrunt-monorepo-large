include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/platform/service-2/application/api-gateway-297",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-3/network/nacl-36",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-3/network/route-table-940",
    "../../../../../../../../us-east-1/qa/finance/data/service-3/network/vpc-878",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//kms-757?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "kms-757"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}