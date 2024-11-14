include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/application/service-3/network/route-table-668",
    "../../../../../../../../eu-west-1/dev/finance/data/service-1/storage/efs-548",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-3/application/event-bus-58",
    "../../../../../../../../us-west-2/qa/operations/application/service-1/security/waf-676",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cloudwatch-600?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cloudwatch-600"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}