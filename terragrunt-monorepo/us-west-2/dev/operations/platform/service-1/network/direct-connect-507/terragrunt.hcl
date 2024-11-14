include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/data/service-2/monitoring/alertmanager-856",
    "../../../../../../../../us-west-2/dev/finance/data/service-1/storage/fsx-708",
    "../../../../../../../../eu-west-1/dev/finance/data/service-2/application/load-balancer-896",
    "../../../../../../../../us-west-2/qa/operations/data/service-1/network/vpn-670",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-2/application/api-gateway-215",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//direct-connect-507?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "direct-connect-507"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}