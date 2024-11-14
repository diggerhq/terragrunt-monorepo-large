include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/data/service-1/monitoring/log-aggregation-189",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-2/monitoring/prometheus-748",
    "../../../../../../../../eu-west-1/dev/operations/application/service-2/compute/lambda-157",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-1/storage/redshift-222",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-260?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-260"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}