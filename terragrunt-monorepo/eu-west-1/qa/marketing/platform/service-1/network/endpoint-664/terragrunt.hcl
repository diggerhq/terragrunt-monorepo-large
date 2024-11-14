include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/platform/service-2/storage/elasticache-37",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-2/storage/rds-612",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-2/compute/auto-scaling-954",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//endpoint-664?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "endpoint-664"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}