include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/data/service-2/application/cache-layer-70",
    "../../../../../../../../eu-west-1/staging/operations/application/service-3/compute/auto-scaling-833",
    "../../../../../../../../us-west-2/dev/finance/platform/service-3/monitoring/grafana-933",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-780?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-780"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}