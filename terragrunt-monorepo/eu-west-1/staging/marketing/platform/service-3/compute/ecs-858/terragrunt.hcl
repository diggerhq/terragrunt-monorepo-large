include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/platform/service-3/storage/fsx-620",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-1/application/cache-layer-675",
    "../../../../../../../../us-east-1/qa/marketing/application/service-1/compute/auto-scaling-199",
    "../../../../../../../../us-west-2/qa/operations/platform/service-3/compute/auto-scaling-888",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ecs-858?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ecs-858"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}