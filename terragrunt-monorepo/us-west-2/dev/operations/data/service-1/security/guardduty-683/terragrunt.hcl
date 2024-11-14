include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/application/service-2/storage/dynamodb-693",
    "../../../../../../../../eu-west-1/dev/finance/application/service-1/application/load-balancer-224",
    "../../../../../../../../us-west-2/staging/finance/application/service-3/application/load-balancer-441",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-3/security/shield-279",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//guardduty-683?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "guardduty-683"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}