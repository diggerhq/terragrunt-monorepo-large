include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/platform/service-1/monitoring/cloudwatch-112",
    "../../../../../../../../us-east-1/dev/operations/platform/service-2/application/cache-layer-512",
    "../../../../../../../../us-east-1/qa/marketing/data/service-1/storage/rds-877",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-727?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-727"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}