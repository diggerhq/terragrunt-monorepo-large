include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-1/compute/spot-fleet-130",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-1/application/event-bus-713",
    "../../../../../../../../us-east-1/staging/marketing/data/service-3/application/cache-layer-522",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-2/security/security-hub-757",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//backup-253?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "backup-253"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}