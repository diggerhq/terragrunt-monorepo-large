include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/data/service-3/monitoring/trace-collection-412",
    "../../../../../../../../us-east-1/dev/operations/platform/service-2/compute/ecs-977",
    "../../../../../../../../eu-west-1/staging/finance/data/service-2/monitoring/log-aggregation-629",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-3/compute/spot-fleet-795",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//eks-916?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "eks-916"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}