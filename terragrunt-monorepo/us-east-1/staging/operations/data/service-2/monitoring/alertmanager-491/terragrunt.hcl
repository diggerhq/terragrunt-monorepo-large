include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/application/service-1/application/load-balancer-649",
    "../../../../../../../../us-west-2/dev/finance/platform/service-1/application/api-gateway-319",
    "../../../../../../../../us-east-1/dev/marketing/data/service-1/monitoring/prometheus-869",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-491?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-491"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}