include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/platform/service-3/storage/backup-937",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-1/security/guardduty-347",
    "../../../../../../../../us-east-1/staging/finance/platform/service-1/monitoring/log-aggregation-513",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//spot-fleet-635?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "spot-fleet-635"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}