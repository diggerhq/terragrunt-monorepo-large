include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/application/service-3/storage/backup-6",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-1/monitoring/alertmanager-150",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-2/compute/batch-285",
    "../../../../../../../../us-west-2/staging/marketing/data/service-1/application/event-bus-685",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fsx-860?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fsx-860"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}