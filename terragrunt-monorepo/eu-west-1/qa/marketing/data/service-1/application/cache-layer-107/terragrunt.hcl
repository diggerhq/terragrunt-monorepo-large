include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-2/monitoring/grafana-679",
    "../../../../../../../../us-east-1/staging/operations/application/service-3/network/subnet-958",
    "../../../../../../../../us-west-2/dev/marketing/data/service-2/monitoring/cloudwatch-923",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-107?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-107"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}