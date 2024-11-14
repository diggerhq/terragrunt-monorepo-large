include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/application/service-1/security/waf-18",
    "../../../../../../../../us-east-1/qa/finance/platform/service-1/security/guardduty-22",
    "../../../../../../../../us-east-1/dev/finance/platform/service-1/network/vpn-565",
    "../../../../../../../../us-east-1/dev/finance/application/service-3/security/waf-457",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//certificates-987?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "certificates-987"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}