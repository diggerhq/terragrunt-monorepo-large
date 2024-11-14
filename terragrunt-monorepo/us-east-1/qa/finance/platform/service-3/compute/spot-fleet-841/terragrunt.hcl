include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/platform/service-2/storage/efs-570",
    "../../../../../../../../us-west-2/staging/operations/data/service-3/monitoring/prometheus-254",
    "../../../../../../../../eu-west-1/dev/operations/application/service-1/monitoring/alertmanager-311",
    "../../../../../../../../us-west-2/dev/operations/data/service-1/security/waf-849",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//spot-fleet-841?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "spot-fleet-841"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}