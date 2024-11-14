include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/data/service-1/monitoring/cloudwatch-22",
    "../../../../../../../../eu-west-1/staging/finance/application/service-1/network/nacl-3",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-2/monitoring/trace-collection-97",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-551?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-551"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}