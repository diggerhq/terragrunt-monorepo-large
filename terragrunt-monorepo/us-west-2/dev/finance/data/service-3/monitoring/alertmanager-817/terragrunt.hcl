include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/platform/service-3/compute/lambda-833",
    "../../../../../../../../us-west-2/dev/operations/data/service-1/network/endpoint-206",
    "../../../../../../../../us-west-2/staging/finance/application/service-3/monitoring/alertmanager-174",
    "../../../../../../../../eu-west-1/dev/operations/data/service-2/compute/spot-fleet-214",
    "../../../../../../../../us-west-2/dev/finance/data/service-2/storage/backup-776",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-817?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-817"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}