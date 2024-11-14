include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/application/service-3/compute/eks-407",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-2/monitoring/cloudwatch-587",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-1/network/route-table-992",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpn-905?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpn-905"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}