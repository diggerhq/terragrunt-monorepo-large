include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/data/service-3/application/load-balancer-389",
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/application/service-mesh-958",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-1/monitoring/prometheus-392",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//lambda-981?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "lambda-981"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}