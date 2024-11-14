include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/platform/service-3/application/event-bus-295",
    "../../../../../../../../us-east-1/staging/finance/application/service-2/network/vpc-242",
    "../../../../../../../../us-west-2/dev/finance/application/service-3/security/guardduty-556",
    "../../../../../../../../us-east-1/qa/finance/application/service-2/monitoring/alertmanager-923",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//dynamodb-352?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "dynamodb-352"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}