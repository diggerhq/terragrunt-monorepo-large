include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/data/service-3/monitoring/alertmanager-9",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-1/monitoring/trace-collection-618",
    "../../../../../../../../us-east-1/staging/operations/application/service-2/application/load-balancer-335",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-417?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-417"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}