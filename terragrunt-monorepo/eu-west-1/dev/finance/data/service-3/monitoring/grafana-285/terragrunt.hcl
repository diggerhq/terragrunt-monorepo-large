include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-2/security/security-hub-973",
    "../../../../../../../../us-west-2/staging/operations/application/service-1/storage/efs-444",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-1/storage/backup-353",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-3/application/event-bus-626",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-285?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-285"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}