include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/application/service-1/security/guardduty-786",
    "../../../../../../../../us-west-2/staging/finance/data/service-2/application/event-bus-746",
    "../../../../../../../../us-west-2/qa/operations/data/service-3/application/load-balancer-805",
    "../../../../../../../../us-west-2/qa/marketing/application/service-3/network/direct-connect-632",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-517?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-517"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}