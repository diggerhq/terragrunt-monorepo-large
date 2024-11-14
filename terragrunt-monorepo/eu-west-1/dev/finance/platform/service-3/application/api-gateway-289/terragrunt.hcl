include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/platform/service-2/compute/batch-798",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-1/monitoring/log-aggregation-727",
    "../../../../../../../../eu-west-1/qa/operations/data/service-3/monitoring/cloudwatch-516",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//api-gateway-289?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "api-gateway-289"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}