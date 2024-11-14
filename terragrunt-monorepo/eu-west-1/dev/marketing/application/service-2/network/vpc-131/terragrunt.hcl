include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/application/service-3/monitoring/alertmanager-224",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-1/network/transit-gateway-293",
    "../../../../../../../../us-east-1/dev/operations/data/service-1/application/queue-771",
    "../../../../../../../../us-east-1/qa/finance/data/service-3/compute/spot-fleet-955",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-2/storage/backup-652",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpc-131?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpc-131"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}