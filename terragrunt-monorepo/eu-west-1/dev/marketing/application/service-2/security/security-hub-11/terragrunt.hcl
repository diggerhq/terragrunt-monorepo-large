include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/data/service-3/monitoring/alertmanager-596",
    "../../../../../../../../us-east-1/staging/finance/data/service-2/monitoring/trace-collection-38",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-1/security/secrets-587",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//security-hub-11?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "security-hub-11"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}