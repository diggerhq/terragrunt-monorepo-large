include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/data/service-3/compute/batch-698",
    "../../../../../../../../us-west-2/dev/marketing/data/service-1/network/nacl-48",
    "../../../../../../../../eu-west-1/dev/operations/application/service-3/compute/eks-422",
    "../../../../../../../../eu-west-1/qa/operations/data/service-1/application/cache-layer-87",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-357?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-357"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}