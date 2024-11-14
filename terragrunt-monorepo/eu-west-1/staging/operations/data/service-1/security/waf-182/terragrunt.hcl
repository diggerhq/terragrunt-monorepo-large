include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/platform/service-3/network/direct-connect-40",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-2/security/waf-95",
    "../../../../../../../../us-west-2/staging/marketing/data/service-3/application/api-gateway-811",
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/security/waf-764",
    "../../../../../../../../us-west-2/qa/marketing/application/service-2/security/waf-908",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//waf-182?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "waf-182"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}