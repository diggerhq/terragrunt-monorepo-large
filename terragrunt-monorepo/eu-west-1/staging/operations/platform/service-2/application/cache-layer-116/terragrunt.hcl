include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/data/service-2/monitoring/alertmanager-535",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-1/network/subnet-55",
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/security/waf-668",
    "../../../../../../../../us-east-1/qa/finance/application/service-1/security/certificates-773",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-116?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-116"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}