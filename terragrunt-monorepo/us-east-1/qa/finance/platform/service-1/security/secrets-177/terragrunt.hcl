include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/application/service-3/storage/backup-51",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-2/security/guardduty-939",
    "../../../../../../../../us-east-1/staging/marketing/application/service-3/application/event-bus-876",
    "../../../../../../../../eu-west-1/staging/finance/application/service-3/compute/auto-scaling-136",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//secrets-177?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "secrets-177"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}