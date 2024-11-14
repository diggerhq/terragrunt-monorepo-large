include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/data/service-2/application/service-mesh-993",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-2/security/shield-678",
    "../../../../../../../../us-east-1/staging/operations/application/service-3/application/service-mesh-505",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-2/application/service-mesh-268",
    "../../../../../../../../us-east-1/qa/marketing/application/service-1/storage/rds-170",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//backup-163?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "backup-163"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}