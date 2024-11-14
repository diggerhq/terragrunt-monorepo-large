include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/application/service-3/application/load-balancer-771",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-2/compute/batch-116",
    "../../../../../../../../us-west-2/dev/operations/data/service-1/monitoring/grafana-758",
    "../../../../../../../../us-west-2/staging/finance/application/service-3/monitoring/alertmanager-176",
    "../../../../../../../../eu-west-1/dev/operations/data/service-3/security/waf-545",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-274?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-274"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}