include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/data/service-3/security/guardduty-569",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-3/application/queue-838",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-2/network/vpn-412",
    "../../../../../../../../eu-west-1/qa/operations/application/service-2/security/guardduty-977",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpn-682?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpn-682"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}