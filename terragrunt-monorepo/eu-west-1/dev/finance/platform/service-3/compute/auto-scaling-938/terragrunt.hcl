include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-3/storage/fsx-669",
    "../../../../../../../../us-west-2/staging/finance/application/service-2/security/shield-98",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-2/compute/ecs-679",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-1/network/direct-connect-149",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-938?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-938"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}