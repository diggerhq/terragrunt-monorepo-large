include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/application/service-1/storage/rds-561",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-1/network/direct-connect-149",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-2/security/kms-502",
    "../../../../../../../../eu-west-1/staging/operations/data/service-1/security/waf-182",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-3/monitoring/grafana-52",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-58?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-58"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}