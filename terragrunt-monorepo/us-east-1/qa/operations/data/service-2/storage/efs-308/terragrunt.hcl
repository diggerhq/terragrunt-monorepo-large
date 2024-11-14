include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-1/monitoring/cloudwatch-232",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-2/security/secrets-387",
    "../../../../../../../../eu-west-1/staging/finance/data/service-1/network/route-table-131",
    "../../../../../../../../us-west-2/staging/finance/application/service-2/security/shield-98",
    "../../../../../../../../us-west-2/dev/marketing/application/service-1/monitoring/alertmanager-264",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//efs-308?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "efs-308"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}