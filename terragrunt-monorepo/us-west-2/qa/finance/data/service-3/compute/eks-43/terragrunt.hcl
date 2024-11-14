include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/platform/service-2/application/service-mesh-281",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-1/network/vpn-164",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-3/network/vpn-569",
    "../../../../../../../../us-east-1/staging/operations/platform/service-1/network/nacl-896",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//eks-43?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "eks-43"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}