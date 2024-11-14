include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/platform/service-2/compute/ec2-209",
    "../../../../../../../../us-east-1/staging/finance/application/service-1/application/event-bus-168",
    "../../../../../../../../us-west-2/qa/finance/application/service-2/security/guardduty-4",
    "../../../../../../../../us-east-1/staging/operations/application/service-1/application/event-bus-763",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//route-table-660?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "route-table-660"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}