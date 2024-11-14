include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/application/service-2/storage/dynamodb-373",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-3/security/guardduty-148",
    "../../../../../../../../us-west-2/dev/operations/application/service-3/network/route-table-754",
    "../../../../../../../../us-east-1/staging/finance/application/service-1/monitoring/cloudwatch-406",
    "../../../../../../../../us-west-2/dev/operations/platform/service-3/network/direct-connect-716",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpn-629?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpn-629"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}