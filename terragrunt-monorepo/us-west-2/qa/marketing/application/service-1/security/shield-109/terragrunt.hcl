include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/application/service-1/security/guardduty-928",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-2/security/secrets-387",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-1/storage/fsx-901",
    "../../../../../../../../us-west-2/staging/operations/data/service-2/storage/fsx-624",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//shield-109?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "shield-109"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}