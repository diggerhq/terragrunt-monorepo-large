include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/platform/service-1/compute/ecs-606",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-2/monitoring/alertmanager-981",
    "../../../../../../../../us-east-1/qa/finance/platform/service-3/storage/s3-895",
    "../../../../../../../../us-east-1/qa/finance/application/service-1/compute/ecs-283",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpn-98?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpn-98"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}