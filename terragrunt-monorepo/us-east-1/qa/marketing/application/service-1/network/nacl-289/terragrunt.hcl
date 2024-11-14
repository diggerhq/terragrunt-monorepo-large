include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/data/service-1/monitoring/log-aggregation-538",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-3/monitoring/prometheus-419",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-1/monitoring/trace-collection-618",
    "../../../../../../../../us-west-2/staging/operations/data/service-1/monitoring/cloudwatch-341",
    "../../../../../../../../eu-west-1/qa/finance/data/service-2/application/api-gateway-893",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//nacl-289?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "nacl-289"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}