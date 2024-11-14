include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/platform/service-3/monitoring/alertmanager-539",
    "../../../../../../../../us-west-2/staging/operations/application/service-2/network/subnet-712",
    "../../../../../../../../us-east-1/staging/finance/application/service-1/security/guardduty-532",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//waf-951?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "waf-951"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}