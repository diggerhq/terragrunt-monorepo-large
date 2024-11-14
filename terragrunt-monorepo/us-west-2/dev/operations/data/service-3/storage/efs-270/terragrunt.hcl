include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/platform/service-1/security/guardduty-703",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-3/monitoring/grafana-831",
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/monitoring/alertmanager-768",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//efs-270?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "efs-270"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}