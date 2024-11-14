include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/application/service-1/storage/efs-770",
    "../../../../../../../../eu-west-1/qa/finance/data/service-1/application/service-mesh-618",
    "../../../../../../../../us-west-2/staging/finance/application/service-1/monitoring/log-aggregation-312",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-1/storage/rds-647",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//secrets-350?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "secrets-350"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}