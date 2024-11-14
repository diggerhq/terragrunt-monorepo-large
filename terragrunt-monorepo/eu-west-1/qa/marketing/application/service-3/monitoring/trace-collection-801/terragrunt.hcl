include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/data/service-1/network/subnet-733",
    "../../../../../../../../us-east-1/dev/marketing/data/service-2/network/subnet-877",
    "../../../../../../../../eu-west-1/dev/finance/data/service-2/monitoring/grafana-674",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-2/network/subnet-260",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-801?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-801"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}