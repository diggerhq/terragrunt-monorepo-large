include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/platform/service-3/compute/batch-995",
    "../../../../../../../../eu-west-1/dev/operations/data/service-2/monitoring/prometheus-500",
    "../../../../../../../../us-east-1/dev/operations/data/service-2/security/waf-541",
    "../../../../../../../../eu-west-1/dev/operations/data/service-3/compute/auto-scaling-615",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-3/application/event-bus-490",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//waf-911?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "waf-911"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}