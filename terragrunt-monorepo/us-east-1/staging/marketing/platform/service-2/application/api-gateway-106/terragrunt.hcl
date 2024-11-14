include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/application/service-3/network/direct-connect-221",
    "../../../../../../../../us-west-2/qa/operations/data/service-2/application/queue-909",
    "../../../../../../../../us-east-1/dev/operations/platform/service-1/network/route-table-333",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-2/security/guardduty-553",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-2/storage/dynamodb-835",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//api-gateway-106?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "api-gateway-106"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}