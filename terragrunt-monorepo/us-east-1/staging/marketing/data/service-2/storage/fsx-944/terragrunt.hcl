include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/platform/service-3/network/direct-connect-795",
    "../../../../../../../../us-east-1/staging/operations/application/service-1/application/service-mesh-421",
    "../../../../../../../../us-west-2/dev/finance/platform/service-1/application/cache-layer-342",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fsx-944?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fsx-944"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}