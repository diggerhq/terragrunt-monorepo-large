include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/platform/service-3/application/queue-900",
    "../../../../../../../../us-east-1/staging/marketing/application/service-3/monitoring/trace-collection-905",
    "../../../../../../../../us-west-2/staging/operations/data/service-3/monitoring/prometheus-254",
    "../../../../../../../../us-east-1/qa/operations/data/service-3/network/direct-connect-35",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//lambda-833?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "lambda-833"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}