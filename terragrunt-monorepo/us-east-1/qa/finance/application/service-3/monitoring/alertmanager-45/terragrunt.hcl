include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/application/service-2/storage/dynamodb-237",
    "../../../../../../../../us-west-2/dev/marketing/application/service-2/network/direct-connect-393",
    "../../../../../../../../us-west-2/qa/finance/platform/service-3/storage/dynamodb-313",
    "../../../../../../../../us-east-1/qa/finance/application/service-1/network/direct-connect-238",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-45?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-45"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}