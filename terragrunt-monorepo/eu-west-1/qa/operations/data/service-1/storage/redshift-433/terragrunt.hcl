include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/platform/service-3/compute/auto-scaling-888",
    "../../../../../../../../eu-west-1/staging/finance/application/service-1/network/nacl-720",
    "../../../../../../../../us-west-2/staging/finance/data/service-3/monitoring/grafana-639",
    "../../../../../../../../eu-west-1/qa/finance/application/service-1/application/api-gateway-947",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//redshift-433?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "redshift-433"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}