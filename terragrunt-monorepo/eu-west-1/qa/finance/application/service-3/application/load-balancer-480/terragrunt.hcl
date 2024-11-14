include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/platform/service-3/network/nacl-935",
    "../../../../../../../../us-west-2/staging/finance/platform/service-1/network/route-table-77",
    "../../../../../../../../eu-west-1/dev/finance/data/service-3/application/api-gateway-474",
    "../../../../../../../../us-east-1/staging/operations/application/service-3/compute/eks-165",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-480?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-480"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}