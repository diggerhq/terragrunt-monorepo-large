include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/application/service-1/storage/efs-390",
    "../../../../../../../../us-west-2/dev/finance/data/service-1/storage/fsx-708",
    "../../../../../../../../eu-west-1/dev/finance/data/service-3/application/cache-layer-801",
    "../../../../../../../../us-west-2/qa/finance/data/service-1/compute/eks-442",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-931?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-931"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}