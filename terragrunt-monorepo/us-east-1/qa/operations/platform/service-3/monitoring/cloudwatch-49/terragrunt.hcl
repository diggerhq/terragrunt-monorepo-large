include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/data/service-1/monitoring/log-aggregation-981",
    "../../../../../../../../us-west-2/dev/finance/platform/service-1/network/direct-connect-407",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-1/application/queue-731",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cloudwatch-49?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cloudwatch-49"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}