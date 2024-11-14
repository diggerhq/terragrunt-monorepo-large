include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/platform/service-3/storage/elasticache-175",
    "../../../../../../../../us-east-1/staging/finance/platform/service-3/security/waf-27",
    "../../../../../../../../us-east-1/qa/finance/platform/service-1/compute/spot-fleet-994",
    "../../../../../../../../eu-west-1/qa/finance/data/service-2/security/secrets-628",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-3/application/queue-360",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//iam-274?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "iam-274"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}