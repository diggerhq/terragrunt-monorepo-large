include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/data/service-2/network/direct-connect-459",
    "../../../../../../../../us-east-1/dev/finance/platform/service-2/application/cache-layer-640",
    "../../../../../../../../us-east-1/dev/finance/application/service-3/monitoring/cloudwatch-128",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//backup-835?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "backup-835"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}