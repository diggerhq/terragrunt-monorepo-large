include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/platform/service-2/monitoring/prometheus-883",
    "../../../../../../../../us-west-2/qa/finance/platform/service-1/security/shield-943",
    "../../../../../../../../eu-west-1/qa/finance/data/service-1/compute/ecs-369",
    "../../../../../../../../us-west-2/dev/marketing/data/service-3/storage/s3-21",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//batch-74?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "batch-74"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}