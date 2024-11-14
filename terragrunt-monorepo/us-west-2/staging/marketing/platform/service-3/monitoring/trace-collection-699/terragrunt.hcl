include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/application/service-3/security/iam-625",
    "../../../../../../../../us-west-2/dev/operations/platform/service-2/monitoring/alertmanager-791",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-2/storage/dynamodb-104",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-699?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-699"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}