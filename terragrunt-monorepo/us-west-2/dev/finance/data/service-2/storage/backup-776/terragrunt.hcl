include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/application/service-2/storage/rds-739",
    "../../../../../../../../us-east-1/staging/marketing/application/service-1/network/vpn-216",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-3/compute/batch-892",
    "../../../../../../../../us-west-2/dev/operations/application/service-2/application/event-bus-30",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//backup-776?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "backup-776"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}