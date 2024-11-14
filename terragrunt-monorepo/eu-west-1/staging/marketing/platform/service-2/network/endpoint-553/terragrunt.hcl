include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/data/service-3/security/guardduty-261",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-2/application/cache-layer-637",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-3/storage/fsx-620",
    "../../../../../../../../us-west-2/dev/marketing/data/service-3/monitoring/grafana-623",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//endpoint-553?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "endpoint-553"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}