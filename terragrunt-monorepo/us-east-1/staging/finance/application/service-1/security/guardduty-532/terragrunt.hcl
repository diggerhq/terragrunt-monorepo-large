include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/data/service-3/monitoring/grafana-749",
    "../../../../../../../../us-west-2/staging/operations/data/service-3/storage/redshift-370",
    "../../../../../../../../us-west-2/dev/finance/data/service-3/compute/spot-fleet-172",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-3/application/event-bus-590",
    "../../../../../../../../eu-west-1/staging/finance/application/service-3/compute/auto-scaling-136",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//guardduty-532?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "guardduty-532"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}