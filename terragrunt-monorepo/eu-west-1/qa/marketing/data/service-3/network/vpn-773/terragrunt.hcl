include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/application/service-2/monitoring/trace-collection-177",
    "../../../../../../../../eu-west-1/qa/finance/application/service-1/application/load-balancer-65",
    "../../../../../../../../us-east-1/qa/finance/platform/service-2/monitoring/log-aggregation-19",
    "../../../../../../../../us-east-1/staging/operations/application/service-2/monitoring/alertmanager-65",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-2/storage/rds-984",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpn-773?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpn-773"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}