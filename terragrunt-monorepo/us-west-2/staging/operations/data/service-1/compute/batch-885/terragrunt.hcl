include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/platform/service-2/monitoring/log-aggregation-19",
    "../../../../../../../../us-west-2/staging/finance/platform/service-3/storage/rds-664",
    "../../../../../../../../us-east-1/dev/marketing/application/service-3/security/security-hub-10",
    "../../../../../../../../us-west-2/qa/finance/platform/service-2/compute/spot-fleet-364",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//batch-885?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "batch-885"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}