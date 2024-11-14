include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/application/service-2/monitoring/grafana-84",
    "../../../../../../../../us-east-1/qa/marketing/data/service-1/network/vpn-267",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-2/security/shield-94",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-3/security/waf-96",
    "../../../../../../../../us-west-2/staging/operations/platform/service-1/security/secrets-74",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//backup-350?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "backup-350"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}