include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/data/service-3/monitoring/prometheus-356",
    "../../../../../../../../us-east-1/dev/finance/platform/service-2/application/cache-layer-502",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-2/monitoring/trace-collection-97",
    "../../../../../../../../us-east-1/dev/finance/platform/service-1/security/certificates-167",
    "../../../../../../../../us-east-1/qa/marketing/data/service-2/monitoring/log-aggregation-774",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//shield-592?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "shield-592"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}