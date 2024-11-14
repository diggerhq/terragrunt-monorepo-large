include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-1/security/security-hub-326",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-3/monitoring/alertmanager-870",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-2/security/guardduty-94",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-3/compute/spot-fleet-553",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//secrets-130?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "secrets-130"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}