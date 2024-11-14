include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/platform/service-2/security/waf-295",
    "../../../../../../../../eu-west-1/staging/operations/application/service-2/storage/fsx-780",
    "../../../../../../../../us-east-1/dev/operations/platform/service-3/compute/auto-scaling-884",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//backup-986?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "backup-986"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}