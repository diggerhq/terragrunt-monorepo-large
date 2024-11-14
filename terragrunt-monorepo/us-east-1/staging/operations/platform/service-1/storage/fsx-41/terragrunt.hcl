include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/platform/service-3/security/secrets-905",
    "../../../../../../../../us-east-1/staging/operations/platform/service-3/security/kms-328",
    "../../../../../../../../us-east-1/dev/finance/platform/service-3/application/load-balancer-213",
    "../../../../../../../../us-west-2/staging/finance/application/service-2/application/load-balancer-297",
    "../../../../../../../../us-west-2/staging/operations/platform/service-2/monitoring/cloudwatch-332",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fsx-41?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fsx-41"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}