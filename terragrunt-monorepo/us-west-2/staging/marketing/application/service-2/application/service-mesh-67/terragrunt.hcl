include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/platform/service-3/security/guardduty-417",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-3/compute/batch-920",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-1/monitoring/prometheus-547",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-67?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-67"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}