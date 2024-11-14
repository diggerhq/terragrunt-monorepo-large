include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/data/service-2/application/load-balancer-736",
    "../../../../../../../../us-west-2/staging/operations/data/service-3/monitoring/prometheus-254",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-3/monitoring/alertmanager-870",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fargate-222?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fargate-222"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}