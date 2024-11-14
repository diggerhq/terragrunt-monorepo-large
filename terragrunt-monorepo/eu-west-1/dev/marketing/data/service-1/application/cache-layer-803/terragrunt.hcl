include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/platform/service-2/network/transit-gateway-772",
    "../../../../../../../../us-east-1/qa/operations/platform/service-3/storage/efs-706",
    "../../../../../../../../us-west-2/dev/marketing/application/service-2/monitoring/log-aggregation-478",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-1/monitoring/trace-collection-95",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-803?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-803"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}