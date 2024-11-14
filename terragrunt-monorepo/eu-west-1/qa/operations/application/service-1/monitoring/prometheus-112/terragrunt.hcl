include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-1/storage/efs-369",
    "../../../../../../../../eu-west-1/qa/operations/application/service-3/monitoring/log-aggregation-737",
    "../../../../../../../../us-west-2/qa/operations/application/service-3/network/direct-connect-51",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-2/application/cache-layer-938",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//prometheus-112?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "prometheus-112"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}