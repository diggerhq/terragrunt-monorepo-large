include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/data/service-2/application/cache-layer-620",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-1/compute/lambda-479",
    "../../../../../../../../us-west-2/dev/finance/data/service-1/network/transit-gateway-372",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-1/monitoring/grafana-517",
    "../../../../../../../../us-west-2/qa/operations/platform/service-2/compute/spot-fleet-153",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//efs-706?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "efs-706"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}