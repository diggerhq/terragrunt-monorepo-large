include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/application/service-2/security/secrets-114",
    "../../../../../../../../us-east-1/staging/finance/data/service-2/network/endpoint-687",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-2/network/route-table-563",
    "../../../../../../../../eu-west-1/dev/operations/data/service-3/network/transit-gateway-684",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpc-859?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpc-859"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}