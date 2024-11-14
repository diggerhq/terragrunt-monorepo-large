include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/application/service-3/compute/fargate-479",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-3/monitoring/alertmanager-254",
    "../../../../../../../../us-west-2/qa/finance/data/service-2/compute/lambda-652",
    "../../../../../../../../us-east-1/qa/finance/platform/service-3/application/load-balancer-555",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-596?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-596"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}