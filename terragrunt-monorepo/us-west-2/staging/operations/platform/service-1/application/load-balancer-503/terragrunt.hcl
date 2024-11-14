include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/application/service-2/network/route-table-834",
    "../../../../../../../../us-east-1/staging/operations/application/service-1/network/endpoint-976",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-3/network/nacl-587",
    "../../../../../../../../us-east-1/dev/marketing/application/service-1/network/route-table-19",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-503?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-503"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}