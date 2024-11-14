include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/data/service-1/security/guardduty-683",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-3/security/shield-966",
    "../../../../../../../../us-west-2/qa/finance/platform/service-3/monitoring/trace-collection-57",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//spot-fleet-400?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "spot-fleet-400"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}