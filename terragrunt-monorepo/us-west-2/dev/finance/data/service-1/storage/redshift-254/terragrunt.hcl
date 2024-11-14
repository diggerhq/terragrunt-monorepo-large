include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/platform/service-3/network/endpoint-309",
    "../../../../../../../../us-west-2/qa/operations/application/service-2/monitoring/cloudwatch-701",
    "../../../../../../../../us-west-2/qa/marketing/application/service-1/monitoring/alertmanager-468",
    "../../../../../../../../us-west-2/dev/finance/application/service-3/monitoring/grafana-610",
    "../../../../../../../../eu-west-1/dev/finance/data/service-1/security/waf-875",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//redshift-254?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "redshift-254"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}