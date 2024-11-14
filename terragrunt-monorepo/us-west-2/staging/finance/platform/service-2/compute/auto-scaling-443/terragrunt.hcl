include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/platform/service-3/storage/redshift-569",
    "../../../../../../../../us-west-2/staging/finance/data/service-1/application/api-gateway-537",
    "../../../../../../../../us-east-1/dev/finance/platform/service-3/monitoring/alertmanager-1",
    "../../../../../../../../us-east-1/qa/finance/application/service-2/network/route-table-767",
    "../../../../../../../../eu-west-1/qa/operations/data/service-2/compute/auto-scaling-386",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-443?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-443"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}