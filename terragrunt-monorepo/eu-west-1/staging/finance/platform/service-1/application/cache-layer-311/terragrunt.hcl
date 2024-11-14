include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/data/service-2/storage/fsx-839",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-1/monitoring/grafana-818",
    "../../../../../../../../us-east-1/dev/finance/platform/service-1/network/vpn-565",
    "../../../../../../../../us-east-1/dev/finance/data/service-3/storage/fsx-89",
    "../../../../../../../../eu-west-1/dev/operations/application/service-2/application/load-balancer-925",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-311?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-311"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}