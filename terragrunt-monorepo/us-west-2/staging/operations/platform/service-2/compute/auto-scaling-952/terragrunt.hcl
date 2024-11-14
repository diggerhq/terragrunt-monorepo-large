include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/application/service-1/monitoring/alertmanager-357",
    "../../../../../../../../us-west-2/qa/finance/application/service-2/monitoring/log-aggregation-798",
    "../../../../../../../../us-east-1/dev/operations/platform/service-1/monitoring/prometheus-945",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-952?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-952"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}