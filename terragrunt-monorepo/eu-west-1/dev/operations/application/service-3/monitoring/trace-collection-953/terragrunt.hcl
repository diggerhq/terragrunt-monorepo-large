include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/application/service-2/monitoring/log-aggregation-97",
    "../../../../../../../../us-east-1/qa/operations/platform/service-3/security/secrets-905",
    "../../../../../../../../eu-west-1/qa/operations/data/service-2/compute/spot-fleet-299",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-953?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-953"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}