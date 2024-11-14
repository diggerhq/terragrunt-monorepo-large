include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/data/service-3/security/shield-665",
    "../../../../../../../../us-west-2/qa/marketing/application/service-1/network/endpoint-138",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-2/monitoring/log-aggregation-252",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-1/compute/lambda-30",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fsx-780?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fsx-780"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}