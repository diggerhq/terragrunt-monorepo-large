include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/application/service-3/storage/elasticache-910",
    "../../../../../../../../us-east-1/staging/marketing/application/service-3/compute/spot-fleet-891",
    "../../../../../../../../eu-west-1/dev/operations/data/service-2/storage/rds-738",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-3/application/event-bus-58",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//backup-931?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "backup-931"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}