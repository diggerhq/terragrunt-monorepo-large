include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/application/cache-layer-87",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-2/monitoring/grafana-679",
    "../../../../../../../../eu-west-1/staging/finance/data/service-2/monitoring/grafana-576",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//secrets-72?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "secrets-72"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}