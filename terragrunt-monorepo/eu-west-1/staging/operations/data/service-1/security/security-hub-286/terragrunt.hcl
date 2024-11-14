include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/data/service-3/monitoring/trace-collection-769",
    "../../../../../../../../us-east-1/staging/operations/application/service-1/monitoring/log-aggregation-160",
    "../../../../../../../../eu-west-1/qa/finance/application/service-1/monitoring/log-aggregation-500",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//security-hub-286?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "security-hub-286"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}