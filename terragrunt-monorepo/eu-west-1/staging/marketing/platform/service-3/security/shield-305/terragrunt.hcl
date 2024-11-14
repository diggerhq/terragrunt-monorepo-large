include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/data/service-2/application/cache-layer-242",
    "../../../../../../../../eu-west-1/staging/operations/application/service-2/application/queue-105",
    "../../../../../../../../eu-west-1/dev/finance/data/service-1/security/waf-875",
    "../../../../../../../../us-west-2/qa/operations/application/service-2/network/direct-connect-230",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-2/security/waf-195",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//shield-305?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "shield-305"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}