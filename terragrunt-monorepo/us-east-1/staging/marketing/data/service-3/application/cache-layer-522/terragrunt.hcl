include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/data/service-1/compute/eks-905",
    "../../../../../../../../us-east-1/dev/finance/platform/service-3/security/kms-715",
    "../../../../../../../../eu-west-1/qa/operations/application/service-3/application/cache-layer-420",
    "../../../../../../../../eu-west-1/qa/operations/application/service-2/monitoring/log-aggregation-709",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-522?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-522"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}