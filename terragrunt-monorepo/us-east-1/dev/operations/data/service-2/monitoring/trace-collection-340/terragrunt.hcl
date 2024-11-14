include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/application/service-3/application/cache-layer-83",
    "../../../../../../../../eu-west-1/dev/operations/application/service-3/compute/eks-422",
    "../../../../../../../../us-west-2/qa/finance/platform/service-2/compute/eks-326",
    "../../../../../../../../us-west-2/dev/marketing/application/service-3/compute/auto-scaling-523",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-340?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-340"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}