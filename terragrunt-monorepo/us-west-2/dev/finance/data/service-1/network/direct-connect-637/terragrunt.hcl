include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/data/service-1/application/cache-layer-904",
    "../../../../../../../../us-east-1/staging/marketing/application/service-3/monitoring/trace-collection-905",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-1/application/queue-997",
    "../../../../../../../../eu-west-1/qa/operations/application/service-2/compute/spot-fleet-173",
    "../../../../../../../../us-east-1/qa/operations/application/service-3/compute/lambda-225",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//direct-connect-637?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "direct-connect-637"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}