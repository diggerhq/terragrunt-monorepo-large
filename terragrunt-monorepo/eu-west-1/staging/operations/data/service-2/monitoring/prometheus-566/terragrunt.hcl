include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/platform/service-1/network/nacl-586",
    "../../../../../../../../us-east-1/qa/finance/data/service-2/network/direct-connect-4",
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/security/waf-668",
    "../../../../../../../../eu-west-1/staging/finance/data/service-3/compute/batch-208",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//prometheus-566?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "prometheus-566"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}