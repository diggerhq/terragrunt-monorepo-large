include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/data/service-3/application/event-bus-185",
    "../../../../../../../../us-east-1/dev/finance/data/service-1/security/security-hub-278",
    "../../../../../../../../us-east-1/staging/marketing/application/service-1/monitoring/grafana-404",
    "../../../../../../../../us-east-1/staging/finance/platform/service-3/compute/spot-fleet-953",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-2/compute/batch-588",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//redshift-274?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "redshift-274"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}