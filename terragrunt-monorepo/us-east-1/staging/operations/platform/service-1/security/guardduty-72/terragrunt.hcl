include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-2/monitoring/grafana-679",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-3/compute/fargate-177",
    "../../../../../../../../eu-west-1/qa/finance/data/service-3/compute/spot-fleet-185",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//guardduty-72?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "guardduty-72"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}