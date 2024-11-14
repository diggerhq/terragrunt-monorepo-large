include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/data/service-1/network/direct-connect-637",
    "../../../../../../../../us-west-2/dev/operations/data/service-1/compute/auto-scaling-496",
    "../../../../../../../../us-east-1/staging/finance/platform/service-2/network/direct-connect-377",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-3/application/cache-layer-942",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-9?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-9"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}