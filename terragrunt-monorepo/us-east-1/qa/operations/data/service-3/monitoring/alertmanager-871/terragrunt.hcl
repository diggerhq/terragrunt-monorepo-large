include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/platform/service-3/application/cache-layer-273",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-2/monitoring/grafana-184",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-2/compute/auto-scaling-473",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-871?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-871"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}