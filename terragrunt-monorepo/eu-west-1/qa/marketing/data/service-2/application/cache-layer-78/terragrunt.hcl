include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/network/direct-connect-763",
    "../../../../../../../../us-west-2/staging/operations/data/service-1/monitoring/cloudwatch-341",
    "../../../../../../../../us-west-2/dev/finance/data/service-3/monitoring/log-aggregation-493",
    "../../../../../../../../us-east-1/qa/operations/application/service-3/security/iam-24",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-78?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-78"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}