include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/data/service-3/network/nacl-376",
    "../../../../../../../../us-west-2/staging/finance/platform/service-2/application/cache-layer-732",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-3/compute/auto-scaling-747",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-641?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-641"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}