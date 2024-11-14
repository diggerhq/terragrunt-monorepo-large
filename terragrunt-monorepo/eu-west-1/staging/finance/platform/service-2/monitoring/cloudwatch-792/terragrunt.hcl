include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/data/service-3/monitoring/grafana-639",
    "../../../../../../../../us-west-2/staging/finance/platform/service-3/monitoring/cloudwatch-51",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-3/network/direct-connect-489",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cloudwatch-792?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cloudwatch-792"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}